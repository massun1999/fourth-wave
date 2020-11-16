class IdeasController < ApplicationController
  
  
  def index
    @ideas = Idea.all.order("created_at DESC")
  end

  def new
    @idea = Idea.new
  end

end
