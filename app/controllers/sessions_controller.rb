class SessionsController < ApplicationController

  def googleAuth
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    redirect_to register_path
  end

  def destroy
    session.delete :user_id
    flash[:message] = 'You have been logged out.'
    redirect_to root_path
  end
end
