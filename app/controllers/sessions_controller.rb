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

  # def authenticate(user)
  #   if user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     flash[:success] = "Welcome, #{user.username}!"
  #     redirect_to dashboard_path
  #   else
  #     flash[:error] = 'Invalid password. Please try again.'
  #     redirect_to root_path
  #   end
  # end

  def destroy
    session.delete :user_id
    flash[:message] = 'You have been logged out.'
    redirect_to root_path
  end
end
