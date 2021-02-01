class SchedulesController < ApplicationController
  layout 'registration'
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]


def index
  users = User.where.not(id: current_user)
  @users = users.page(params[:users_page]).per(6)
  @sdate_all = Sdate.all
  @schedule_all = Schedule.all

  date_today
end

def show
end

def new
  @sdate_schedule = SdateSchedule.new
end

def create
  @sdate_schedule = SdateSchedule.new(schedule_params)
  @sdate_schedule.save
  redirect_to schedules_path
end

def destroy
  @set_schedule.destroy
  redirect_to schedules_path
end

private

def schedule_params
  params.require(:sdate_schedule).permit(:subject, :start_time, :end_time, :sdate, :syear, :smonth, :sday)
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
