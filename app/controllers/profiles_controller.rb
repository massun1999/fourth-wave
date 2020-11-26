class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    if @profile = Profile.create(profile_params)
      redirect_to user_path(current_user.id)
    else
      render action: :new
    end
  end


  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
  end


  def update
    @user = User.find(params[:id])
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:free).merge(user_id: current_user.id)
  end
end
