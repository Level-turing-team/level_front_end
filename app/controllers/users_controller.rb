class UsersController < ApplicationController
  def edit
    @user = User.find_by(google_id: session[:user_id])
  end

  def update
    @user = User.find_by(google_id: session[:user_id])
    BackendService.post_profile_picture(params[:user][:picture])
    if params[:user][:username] == "" || params[:user][:zip] == ""
      redirect_to register_path
    else
      @user.update(user_params)
      redirect_to dashboard_index_path
    end
  end

  def show
    @user = User.find_by(google_id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,:bio, :zip, :picture_url)
  end
end
