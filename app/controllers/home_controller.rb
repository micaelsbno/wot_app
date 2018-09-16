class HomeController < ApplicationController
  def index
    unless logged_in
      redirect_to '/login'
    else
      redirect_to '/events'  
    end
  end

  def login
    render :login
  end

  def fb_login
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
    Database.add_user_session(current_user.id)
    if current_user.user_sessions.count > 1
      redirect '/'
    else
      redirect '/login'
    end
  end


end
