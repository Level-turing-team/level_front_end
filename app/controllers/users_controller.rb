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
    @current_user = current_user
    !!params[:lookup] ? @user = User.find(params[:lookup]) : @user = User.find_by(google_id: session[:user_id])
    @distance = BackendService.get_distance(@current_user.id,@user.id)[:data] unless @current_user.zip.nil? || @current_user.username.nil? || params[:lookup].nil?
    @profile_data = params[:lookup].nil? ? BackendFacade.profile_objects(@current_user.id) : BackendFacade.profile_objects(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,:bio, :zip, :picture_url)
  end
end
