class CirclesController < ApplicationController 
  def create 
    response = CircleFacade.create_user_circle(params[:user_id], params[:following_id])
    redirect_to profile_path({lookup: params[:following_id]})
  end
end