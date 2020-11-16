class IdeasController < ApplicationController
  
  
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
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :text, :category_id, :format_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end

end
