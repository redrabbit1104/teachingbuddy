class BoardsController < ApplicationController

  def index
    #現在ログイン中のidを除いたユーザー情報を取得
    users = User.where.not(id: current_user)
    @users = users.page(params[:page]).per(6)
    date_today
    @board = Board.all
  end

  def create
    board = Board.create(post: params[:post])
    render json:{ board: board }
  end
  
  private

  def date_today
    require "date"
    now = Date.today
    wday = now.wday
    wday_jan = ["月","火","水","木","金","土","日"]
    @this_year = now.year
    @this_month = now.month
    @this_day = now.day
    @this_wday = wday_jan[wday]
  end

end
