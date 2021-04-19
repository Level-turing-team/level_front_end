class GalleriesController < ApplicationController


  def create_profile_gallery_picture
    @user = current_user
    BackendFacade.create_profile_gallery_and_photo(@user.id, params[:profile_gallery_picture])
    redirect_to dashboard_index_path
  end

end
