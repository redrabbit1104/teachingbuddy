class ConfirmedschedulesController < ApplicationController
  layout 'registration'

def index
  @sdate_all = Sdate.all
  @schedule_all = Schedule.all
  date_today
end

def new
  @sdate_all = Sdate.all
  @schedule_all = Schedule.all
  date_next_today
end

private

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

def date_next_today
  @now = Date.today
  @wday_jan = ["月","火","水","木","金","土","日"]
  @this_year = @now.year
  @this_month = @now.month

  @next_month = @now.next_month.month
  
  @first_day = @now.end_of_month + 1
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
