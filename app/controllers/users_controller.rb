class UsersController < ApplicationController
  before_action :set_user

  def show
    @ideas = @user.ideas.order("created_at DESC").includes(:user)
  end


  def edit
    if current_user.id != @user.id
      redirect_to action: :show
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  #フォロー機能に関する処理
  def follow
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end

  def followers
  end

  def follows
  end

  #//フォロー機能に関する処理

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
