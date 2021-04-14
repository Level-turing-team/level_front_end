class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user
      authenticate(user)
    else
      flash[:error] = 'Invalid username and password.'
      redirect_to root_path
    end
  end

  def googleAuth
      access_token = request.env["omniauth.auth"]
      user = User.from_omniauth(access_token)
      session[:user_id] = user.google_id
      if User.find_by(google_id: user.google_id)
        redirect_to dashboard_index_path
      else
        redirect_to register_path
      end
    end

  def destroy
    session.delete :user_id
    flash[:message] = 'You have been logged out.'
    redirect_to root_path
  end
end
