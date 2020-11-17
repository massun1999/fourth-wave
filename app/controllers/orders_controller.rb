class OrdersController < ApplicationController

  def index
    @idea = Idea.find(params[:idea_id])
    @order = Order.new
  end

  def create
  end
  
end
