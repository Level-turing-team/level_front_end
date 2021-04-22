class PhotosController < ApplicationController

  def create
    @user = current_user
    gallery_id = params[:galleries].first if params[:galleries].present?
    description = params[:description] if params[:description].present?
    image = params[:images] if params[:images].present?
    PhotoFacade.create_photos(@user.id, gallery_id, description, image)
    redirect_to "/galleries?gallery_id=#{params[:galleries].first}"
  end
end
