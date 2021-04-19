class GalleriesController < ApplicationController

  def index
    @user = current_user
    @galleries = GalleryFacade.profile_object(@user.id).galleries.first
  end

  def create_gallery_and_photo
    @user = current_user
    BackendService.post_user_galleries(@user.id, params[:name], params[:images])
    redirect_to '/galleries'
  end

end
