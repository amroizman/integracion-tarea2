
class ArticlesController < ApplicationController

  def index
    articles = Article.all.order("created_at DESC").limit(10)
    render json: articles, status: :ok
  end

  def show
    article = Article.find(params[:id])
    render json: article, status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: article, status: :ok
  end

  def update
    article = Article.find(params[:id])
    if article.update_attributes(article_params)
      render json: article, status: :ok

    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.permit(:title, :subtitle, :body)
  end



end
