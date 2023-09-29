class OrderArticlesController < ApplicationController

  # def index
  #   @order_articles = OrderArticle.all
  # end

  def new
    @order_article = OrderArticle.new
    @current_user = current_user
  end

  def create
    @article = Article.find(params[:article_id])
    @article = current_article
    @order = current_order
    @order_article = Order_article.new(order_article_params)
    @order_article.save
    @order_article.article = @article
    @order_article.order.user = current_user
    # session[:order_id] = @order.id
    if @order_article.save
      redirect_to order_articles_path(@order_article), notice: 'Article was added to order'
    else
      render :new, status: :unprocessable_entity, alert: 'Failed to add article to order'
    end
  end

  def show
    @order_articles = current_user.order_articles
  end

  #   def update
  #     @order = current_order
  #     @order_article = @order.order_articles.find(params[:id])
  #     @order_article.update_attributes(order_article_params)
  #     @order_articles = current_order.order_articles
  #   end

  #   def destroy
  #     @order = current_order
  #     @order_article = @order.order_articles.find(params[:id])
  #     @order_article.destroy
  #     @order_items = current_order.order_articles
  #   end

  private

  def order_article_params
    params.require(:order_article).permit(:order_id, :article_id, :quantity, :subtotal, :unit_price)
  end
end
