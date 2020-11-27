class IdeasController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_idea, only: [ :edit, :update, :show, :destroy]
  before_action :move_to_root, only: [ :edit ]
  
  def index
    @ideas = Idea.all.order("created_at DESC").includes(:user)
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

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
    @tip_total = Order.tip(params[:id])
    @comment = Comment.new
    @comments = @idea.comments.includes(:user)
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

  def search
    @ideas = Idea.search(params[:keyword])
  end

  private

  def move_to_root
    @idea = Idea.find(params[:id])
    if current_user.id != @idea.user_id
      redirect_to root_path
    end
  end

  def idea_params
    params.require(:idea).permit(:title, :text, :category_id, :user_id, :image).merge(user_id: current_user.id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
  
end
