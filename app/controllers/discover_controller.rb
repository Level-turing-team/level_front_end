class DiscoverController < ApplicationController
  before_action :authorized, only: [:index]

  def index
    @user = current_user
    @artists = BackendFacade.artists_near_me(@user.id)
  end
end
