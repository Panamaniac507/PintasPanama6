class OrdersController < ApplicationController
  # before_action :set_order, only: %i[show]

  # def show
  #   @order_articles = current_user.order_articles
  # end

  # def index
  #   @orders = Order.all
  # end
  def show
    @order = Order.find(params[:id])
    # @order = current_user.order
  end

  def new
    @order = Order.new
    @current_user = current_user
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to orders_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   # @article = Article.find(params[:id])
  #   if @order.update(order_params)
  #     redirect_to order_path(@order)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   # @article = Article.find(params[:id])
  #   @order.destroy
  #   redirect_to orders_path(@orders), status: :see_other
  # end

  private

  # def set_order
  #   @order = Order.find(params[:id])
  # end

  def order_params
    params.require(:order).permit(:user_id, :sub_total, :shipping, :tax, :total, :status)
  end
end
