class OrdersController < ApplicationController

  def index
    @idea = Idea.find(params[:idea_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @idea = Idea.find(params[:idea_id])
      render "orders/index"
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :idea_id, :price).merge(user_id: current_user.id, idea_id: params[:idea_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
end
