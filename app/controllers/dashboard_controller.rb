class DashboardController < ApplicationController
  def index
    @user = current_user
    @community = BackendService.user_circle(@user.id)
    
  end
end
