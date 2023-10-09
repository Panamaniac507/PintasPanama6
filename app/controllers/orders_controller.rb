class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  # def new
  #   @order = Order.new
  #   @order.user = current_user
  # end

  def create
    @order = current_order
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.item = @item
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:user_id, :item_id, :sub_total, :shipping, :tax, :total)
  end
end
