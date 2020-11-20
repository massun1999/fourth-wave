class IdeasController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_idea, only: [:show, :destroy]
  
  
  def index
    @ideas = Idea.all.order("created_at DESC")
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @idea.user_id
      if @idea.destroy
        redirect_to root_path
      end
    else
      render :show
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :text, :category_id, :format_id, :user_id, :image).merge(user_id: current_user.id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

end
