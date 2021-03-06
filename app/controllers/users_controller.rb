class UsersController < ApplicationController

  def edit
    @user = User.find_by(google_id: session[:user_id])
  end

  def update
    @user = User.find_by(google_id: session[:user_id])
    if params[:user][:username] == "" || params[:user][:zip] == ""
      redirect_to register_path
    end
    BackendFacade.create_profile(@user.id,params[:user][:zip])
    BackendFacade.create_profile_gallery_and_photo(@user.id, params[:user][:photo_description], params[:user][:picture_url])
    @user.update(user_params)
    redirect_to dashboard_index_path
  end

  def show
    @current_user = current_user
    # require "pry"; binding.pry
    !!params[:lookup] ? @user = User.find(params[:lookup]) : @user = User.find_by(google_id: session[:user_id])
    # @not_current_user = User.find(params[:lookup])
    @distance = BackendService.get_distance(@current_user.id,@user.id)[:data] unless (@current_user.zip.nil? || @current_user.username.nil?) || (!params[:lookup].nil? && @current_user.zip.nil?)
    # Will need to change last conditional to => unless !params[:lookup] once app goes live in production
    @circle_ids = BackendFacade.user_circle_objects(@current_user.id).map{|user| user.id}
    @profile_data = params[:lookup].nil? ? ProfileFacade.profile_object(@current_user.id) : ProfileFacade.profile_object(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :bio, :zip, :picture_url)
  end
end
