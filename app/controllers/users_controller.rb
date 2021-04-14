class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(new_params)
    if user.id
      flash[:success] = 'Account created successfully.'
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def new_params
    new_params = user_params
    new_params[:first_name] = user_params[:first_name].downcase
    new_params[:last_name] = user_params[:last_name].downcase
    new_params[:username] = user_params[:username].downcase
    new_params[:email] = user_params[:email].downcase
    new_params
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email)
  end
end
