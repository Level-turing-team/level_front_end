class UsersController < ApplicationController

  def edit
    @user = User.find_by(google_id: session[:user_id])
  end

  def update
    @user = User.find_by(google_id: session[:user_id])
    if params[:user][:username] == "" || params[:user][:zip] == ""
      redirect_to register_path
    end
    BackendFacade.create_profile(@user.id, params[:user][:zip], params[:user][:username], params[:user][:picture_url])
    # BackendFacade.create_profile_gallery_and_photo(@user.id, params[:user][:picture_url])
    @user.update(user_params)
    redirect_to dashboard_index_path
  end

  def show
    @current_user = current_user
    !!params[:lookup] ? @user = User.find(params[:lookup]) : @user = User.find_by(google_id: session[:user_id])
    # require 'pry'; binding.pry
    @distance = BackendService.get_distance(@current_user.id,@user.id)[:data] unless @current_user.zip.nil? || @current_user.username.nil? || !params[:lookup].nil?
    @profile_data = params[:lookup].nil? ? BackendFacade.profile_object(@current_user.id) : BackendFacade.profile_object(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :bio, :zip, :picture_url)
  end
end
