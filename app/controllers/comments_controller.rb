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
      if @comment.user_id == current_user.id
        @comment.destroy
        redirect_to board_path(@comment.board_id), flash: {notice: "コメントを削除しました"}
      else
        redirect_back fallback_location: board_path, flash: {notice: "自分のコメントのみ削除できます"}
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment, :user_id)
  end
end
