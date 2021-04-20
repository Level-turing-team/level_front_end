class GalleriesController < ApplicationController

  def index
    @user = current_user
    @galleries = GalleryFacade.profile_object(@user.id).galleries
  end

  def show
    @user = current_user
    @gallery = GalleryFacade.profile_object(@user.id).galleries.find do |gallery|
      gallery.id == params[:id]
    end
  end

  def create_gallery_and_photo
    name =  params[:name] if !params[:name].nil?
    @user = current_user
    BackendService.post_user_galleries(@user.id, name, params[:images], params[:description])
    redirect_to '/galleries'
  end

end
