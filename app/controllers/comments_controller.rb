class CommentsController < ApplicationController

  def index
    comments = Article.find(params[:article_id]).comments
    render json: {status: 'SUCCESS', message: 'Loaded comments', data:comments}, status: :ok
  end

  def show
    comment = Article.find(params[:article_id]).comments.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded comment', data:comment}, status: :ok
  end

  def create
    comment = Article.find(params[:article_id]).comments.new(comment_params)
    if comment.save
      render json: {status: 'SUCCESS', message: 'Comment saved', data:comment}, status: :created
    else
      render json: {status: 'ERROR', message: 'Comment not saved', data:comment.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Article.find(params[:article_id]).comments.find(params[:id])
    comment.destroy
    render json: {status: 'SUCCESS', message: 'Comment deleted', data:comment}, status: :ok
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.permit(:comment, :author)
  end

end
