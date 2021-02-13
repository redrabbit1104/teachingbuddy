class ChecksController < ApplicationController
  def create
    Check.create(check_params)
    redirect_to "/schedules/#{check.schedule.id}"
  end

  private
  def check_params
    params.require(:check).permit(:check).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end
end
