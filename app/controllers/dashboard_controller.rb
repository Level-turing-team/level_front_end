class DashboardController < ApplicationController
  before_action :authorized, only: [:index]

  def index
    @user = current_user
    @profile = DashboardFacade.profile_object(@user.id)
    @profile_photo = @profile.galleries.first.photos.first
    @circle = @profile.circle
    @circle_posts = @profile.circle_posts
    @tags = @profile.tags
  end

  def create_post
    @user = current_user
    BackendService.create_user_post(@user.id, params[:content], params[:link])
    redirect_to dashboard_index_path(@user)
  end
end
