require_relative 'helpers/database'

class SessionsController < ApplicationController
  
  def current_user
    binding.pry
    User.find_by(id: session[:user_id])
  end

  def create 
    @info = HTTParty.get("https://graph.facebook.com/v3.0/me?fields=id%2Cname%2Cfriends%2Cpicture%2Cemail%2Cevents&access_token=#{params[:access_token]}")
    @access_token = params[:access_token]

    Database.add_user(@info)
    if @info['events']
      @info['events']['data'].each { |event|
        Database.add_place(event)
        Database.add_event(event, @access_token, @info)
      }
    end
    session[:user_id] = User.find_by(fb_id: @info['id']).id
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
