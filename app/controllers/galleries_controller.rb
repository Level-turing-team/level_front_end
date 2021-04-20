class GalleriesController < ApplicationController

  def index
    @user = current_user
    @galleries = GalleryFacade.profile_object(@user.id).galleries
    @photos = [] if !params[:gallery_id]
    @gallery = @galleries.find {|gall| gall.id == params[:gallery_id] }
    @photos = @gallery.photos if params[:gallery_id]
  end

  def show
    @user = current_user
    @gallery = GalleryFacade.profile_object(@user.id).galleries.find do |gallery|
      gallery.id == params[:id]
    end
  end

  def create
    name =  params[:name] if params[:name].present?
    image = params[:images] if params[:images].present?
    description = params[:description] if params[:description].present?
    @user = current_user
    BackendService.post_user_galleries(@user.id, name, image, description)
    redirect_to '/galleries'
  end

end
