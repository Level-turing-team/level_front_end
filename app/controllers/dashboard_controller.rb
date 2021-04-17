class DashboardController < ApplicationController
  def index
    @user = current_user
    @user_profile_object = BackendFacade.profile_objects(@user.id)
    @circle = User.find_circle(@user_profile_object.circle)
  end
end
