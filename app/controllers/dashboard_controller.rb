class DashboardController < ApplicationController
  before_action :authorized, only: [:index]

  def index
    @user = current_user
    @user_profile_object = BackendFacade.profile_objects(@user.id)
    # @circle = User.find_circle(@user_profile_object.circle)
    # require "pry"; binding.pry
    # @circle_posts_objects = User.find_circle_posts(@user_profile_object.circle_posts)
  end
end
