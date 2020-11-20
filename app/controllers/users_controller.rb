class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.order("created_at DESC").includes(:user)
  end


  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to action: :show
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
