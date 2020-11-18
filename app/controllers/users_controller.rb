class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas
  end


  def edit
  end

  def update
    binding.pry
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
