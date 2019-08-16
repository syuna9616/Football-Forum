class BoardsController < ApplicationController
  before_action :find_board_from_id, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path, flash: {notice: "掲示板「#{@board.title}」を編集しました"}
    else
      redirect_back(fallback_location: edit_board_path, flash: {notice: "掲示板の編集に失敗しました"})
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: {notice: "掲示板「#{@board.title}」を削除しました"}
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def find_board_from_id
    @board = Board.find(params[:id])
  end
end
