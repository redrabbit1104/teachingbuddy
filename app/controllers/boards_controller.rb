class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_board, only: [:edit, :update, :destroy]

  def index
    #現在ログイン中のidを除いたユーザー情報を取得
    users = User.where.not(id: current_user)
    @users = users.page(params[:users_page]).per(6)
    # @rooms = Room.all
    date_today
    board_page
  end

  def create
    board = Board.create(post_params)
    render json:{ board: board }
  end

  def edit
    users = User.where.not(id: current_user)
    @users = users.page(params[:page]).per(6)
    date_today
  end

  def update
    @board.update(edit_post_params)
    redirect_to root_path
  end

  def destroy
    @board.destroy
    redirect_to root_path
  end

  private

  def post_params
   params.permit(:post).merge(user_id: current_user.id)
  end

  def edit_post_params
    params.require(:board).permit(:post).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def date_today
    require "date"
    now = Date.today
    wday = now.wday
    wday_jan = ["月","火","水","木","金","土","日"]
    @this_year = now.year
    @this_month = now.month
    @this_day = now.day
    @this_wday = wday_jan[wday - 1]
  end

  def board_page
    @boards = Board.all
    @boards = Board.page(params[:page]).per(7)
  end

end
