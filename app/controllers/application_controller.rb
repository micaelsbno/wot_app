class ApplicationController < ActionController::Base

  def logged_in
    User.find_by(id: session[:user_id])
  end

end
