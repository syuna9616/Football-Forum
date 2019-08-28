class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to comment.board
    else
      redirect_back fallback_location: comment.board, flash: {alert: comment.errors.full_messages}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to board_path, flash: {notice: "コメントを削除しました"}
  end

  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
