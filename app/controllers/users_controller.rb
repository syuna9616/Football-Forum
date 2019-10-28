class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @boards = Board.where(user_id: @user.id).page(params[:page])
  end
end
