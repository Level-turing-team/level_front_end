class DiscoverController < ApplicationController
  before_action :authorized, only: [:index]

  def index
    @user = User.find(1)
    # binding.pry
    @search_results = DiscoverFacade.search_user_objects(@user.id, params[:search_term], params[:search_type])
    @profiles = DiscoverFacade.artists_near_me(@user.id)
    @photos = DiscoverFacade.recent_photo_objects
  end

  private

  def user_params
    params.permit(:search_term, :search_type)
  end
end
