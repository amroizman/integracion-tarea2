class CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: {status: 'SUCCESS', message: 'Loaded comments', data:comments}, status: :ok
  end
  # 
  # def show
  #   comment = Article.comments
  #   render json: {status: 'SUCCESS', message: 'Loaded comment', data:comment}, status: :ok
  # end
  #
  # def create
  #   comment = Comment.new(comment_params)
  #   if comment.save
  #     render json: {status: 'SUCCESS', message: 'Comment saved', data:comment}, status: :ok
  #   else
  #     render json: {status: 'ERROR', message: 'Comment not saved', data:comment.errors}, status: :unprocessable_entity
  #   end
  # end
  #
  # def destroy
  #   comment = Comment.find(params[:id])
  #   comment.destroy
  #   render json: {status: 'SUCCESS', message: 'Comment deleted', data:comment}, status: :ok
  # end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:author, :comment, :article_id)
  end

end
