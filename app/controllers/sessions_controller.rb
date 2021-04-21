class SessionsController < ApplicationController

  def googleAuth
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    session[:user_id] = user.google_id
    if user.username.nil? || user.zip.nil?
      redirect_to register_path
    else
      redirect_to dashboard_index_path(user)
    end
  end

  def destroy
    session.delete :user_id
    flash[:message] = 'You have been logged out.'
    redirect_to root_path
  end
end
