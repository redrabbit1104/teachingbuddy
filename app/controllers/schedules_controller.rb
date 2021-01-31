class SchedulesController < ApplicationController

def index
end

def show
  @show = Schedule.find(params[:id])
end

def new
  @sdate_schedule = SdateSchedule.new
end

def create
  @sdate_schedule = SdateSchedule.new(schedule_params)
  @sdate_schedule.save
  redirect_to schedules_path
end

private

def schedule_params
  params.require(:sdate_schedule).permit(:subject, :start_time, :end_time, :sdate, :syear, :smonth, :sday)
end



end
