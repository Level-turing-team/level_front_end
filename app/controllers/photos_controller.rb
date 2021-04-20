class PhotosController < ApplicationController

  def create
    @user = current_user
    BackendService.post_gallery_photo(@user.id,params[:galleries].first, params[:description], params[:images])
    redirect_to "/galleries?gallery_id=#{params[:galleries].first}"
  end


end
