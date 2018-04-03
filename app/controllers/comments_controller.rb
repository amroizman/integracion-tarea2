class CommentsController < ApplicationController

  def index
    comments = Article.find(params[:article_id]).comments
    render json: comments, status: :ok
  end

  def show
    comment = Article.find(params[:article_id]).comments.find(params[:id])
    render json: comment, status: :ok
  end

  def create
    comment = Article.find(params[:article_id]).comments.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Article.find(params[:article_id]).comments.find(params[:id])
    comment.destroy
    render json: comment, status: :ok
  end

  def update
    comment = Article.find(params[:article_id]).comments.find(params[:id])
    if comment.update_attributes(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.permit(:comment, :author)
  end


end
