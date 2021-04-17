class DashboardController < ApplicationController
  before_action :authorized, only: [:index]
  
  def index
    @user = current_user

  end
end
