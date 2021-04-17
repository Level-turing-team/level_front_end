class SessionsController < ApplicationController

  def new
    require "pry"; binding.pry
    @user = User.find(params[:id])
  end

  def googleAuth
    access_token = request.env["omniauth.auth"]
    @user = User.from_omniauth(access_token)
    require "pry"; binding.pry
    render :new
  end

  def create
    BackendService.post_profile_picture(params[:user][:picture])
    if params[:user][:username] == "" || params[:user][:zip] == ""
      redirect_to register_path
    else
      redirect_to dashboard_index_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:message] = 'You have been logged out.'
    redirect_to root_path
  end
end
