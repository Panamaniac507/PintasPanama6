class OrderArticlesController < ApplicationController

  def index
    @order_articles = Order_article.all
  end

  def show
    @order_article = Order_article.find(params[:id])
  end

  def new
    @order_article = Order_article.new
    @current_user = current_user
  end

  def create
    @article = Article.find(params[:article_id])
    @order_article = @order.order_article.create!(order_articles_params)
    if @order_article.save
      redirect_to order_articles_path(@order_article), notice: 'Article was added to order'
    else
      render :new, status: :unprocessable_entity, alert: 'Failed to add article to order'
    end
  end

  private

  def order_articles_params
    params.require(:article).permit(:order_id, :article_id, :quantity, :subtotal)
  end
end
