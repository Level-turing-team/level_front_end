class CirclesController < ApplicationController 
  def create 
    # BackendService.create_user_circle(user_id, following_id)
    response = CircleFacade.create_user_circle(params[:user_id], params[:following_id])
    # binding.pry
    redirect_to profile_path({lookup: params[:following_id]})
  end
end