class DashboardController < ApplicationController
  before_action :authorized, only: [:index]

  def index
    @user = current_user
    @photo = BackendService.get_user_galleries(@user.id)[:data].first[:attributes]
  end
end
