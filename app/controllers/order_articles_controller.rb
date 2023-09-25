class OrderArticlesController < ApplicationController

  def index
    @order_articles = Article.all
  end

  def show
    @order_article = Article.find(params[:id])
  end

  def new
    @order_article = Order_article.new
    @current_user = current_user
  end

  def create
    @order_article = Order_article.new(order_articles_params)
    @order_article.order.user = current_user
    if @order_article.save
      redirect_to order_articles_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_articles_params
    params.require(:article).permit(:order_id, :article_id, :quantity, :subtotal)
  end
end
