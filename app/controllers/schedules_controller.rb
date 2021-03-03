class SchedulesController < ApplicationController
  layout 'registration'
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_check, only: [:show]

def index
  users = User.where.not(id: current_user)
  @users = users.page(params[:users_page]).per(6)
  @sdate_all = Sdate.all
  @schedule_all = Schedule.all
  @checks_all = Check.where(user_id: current_user.id, check: 1).page(params[:page]).per(3) if user_signed_in?

  date_today
end

def update
  @set_schedule.update(edit_schedule_params)
  redirect_to new_schedule_path
end

def new
  @sdate_schedule = SdateSchedule.new
  @sdate_all = Sdate.all
  @schedule_all = Schedule.all

  date_today
end

def show
  @check = Check.new
  @checks = @set_schedule.checks.includes(:user_name)
  @sdate = Sdate.all
  get_check_schedule_user
end

def preview
  @schedule = Schedule.find(params[:id])
  get_check_schedule_user
  get_confirmed_schedule_user
end

def next_preview
  @schedule = Schedule.find(params[:id])
  get_check_schedule_user
  get_confirmed_schedule_user
end

def create
  @sdate_schedule = SdateSchedule.new(schedule_params)
  @sdate_schedule.save
  redirect_to new_schedule_path
end

def destroy
  @set_schedule.destroy
  redirect_to new_schedule_path
end

private
#スケジュールをチェックしたユーザーidを取得
def get_check_schedule_user
  @get_checked_schedule_users = Check.where(schedule_id: params[:id], check: 1).pluck(:user_id)
end 

def get_confirmed_schedule_user
  @get_confirmed_schedule_users = Confirm.where(schedule_id: params[:id], check: 1).pluck(:user_id)
end 

def schedule_params
  params.require(:sdate_schedule).permit(:subject, :start_time, :end_time, :sdate)
end

def edit_schedule_params
  params.require(:schedule).permit(:subject, :start_time, :end_time)
end

#@set_checkが:idパラメーターを渡すか、空の容器なのかによって@set_checkの値を分岐させる。
def set_check
#showの段階ではparams[:id]はshcedule_id値。現在のユーザーidがcheckテーブルのuser_idと同じであれば更新処理のためのテーブル情報を渡す。
  if current_user.id == Check.where(schedule_id: params[:id], user_id: current_user.id).pluck(:user_id)[0]
    @set_check = Check.find_by(params[:id])
#現在のユーザーidがcheckテーブルに存在しなければ、新規エントリとして空の容器を用意。
  else
    @set_check = Check.new
  end
end

def set_schedule
  @set_schedule = Schedule.find(params[:id])
end

def date_today
  @now = Date.today
  @wday_jan = ["月","火","水","木","金","土","日"]
  @this_year = @now.year
  @this_month = @now.month
  
  
  @first_day = @now.beginning_of_month
  @last_day = (@first_day + (7-@first_day.wday))
  @week_period = (@first_day..@last_day)

  @last_day2 = (@last_day + (7-@last_day.wday))
  @week_period2 = ((@last_day+1)..@last_day2)

  @last_day3 = (@last_day2 + (7-@last_day2.wday))
  @week_period3 = ((@last_day2+1)..@last_day3)

  @last_day4 = (@last_day3 + (7-@last_day3.wday))
  @week_period4 = ((@last_day3+1)..@last_day4)

  @last_day5 = (@last_day4 + (7-@last_day4.wday))
  @week_period5 = ((@last_day4+1)..@last_day5)

  @last_day6 = (@last_day5 + (7-@last_day5.wday))
  @week_period6 = ((@last_day5+1)..@last_day6)

end

end
