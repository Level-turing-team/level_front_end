class DashboardController < ApplicationController
  def index
    @user = current_user
    @community = BackendService.user_circle(@user.id)
    @feed_posts = BackendService.user_feed(@user.id)
  end
end
