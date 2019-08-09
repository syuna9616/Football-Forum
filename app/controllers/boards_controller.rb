class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to boards_path, flash: {notice: "掲示板「#{board.title}」を作成しました"}
    else
      redirect_back(fallback_location: new_board_path, flash: {notice: "掲示板の作成に失敗しました"})
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
