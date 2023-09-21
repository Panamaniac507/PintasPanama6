class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @current_user = current_user
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path(@articles), status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:article_description, :price, :stock_qty, :availability)
  end
end
