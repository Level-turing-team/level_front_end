class GalleriesController < ApplicationController


  def create_gallery_and_photo
    @user = current_user
    BackendFacade.post_user_galleries(@user.id, params[:name] params[:profile_gallery_picture])
    redirect_to :back
  end

end
