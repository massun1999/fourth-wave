class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@nickname = user.nickname
    @ideas = @user.ideas
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
  end

end
