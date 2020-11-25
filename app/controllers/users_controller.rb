class UsersController < ApplicationController
  before_action :set_user

  def show
    @ideas = @user.ideas.order("created_at DESC").includes(:user)
    #DM機能の処理
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
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
