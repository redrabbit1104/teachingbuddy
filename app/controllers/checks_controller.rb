class ChecksController < ApplicationController
  before_action :check_params, only: [:show, :edit, :destroy]
  before_action :check_update_params, only: :update

  def create
      check = Check.create(check_params)
      redirect_to schedules_path
  end

  def update
    #現在のユーザーがチェックテーブルのチェックをしたユーザーか否かによって保存処理ができるか出来ないかを分岐させる
    if current_user.id == Check.where(schedule_id: params[:schedule_id], user_id: current_user.id).pluck(:user_id)[0]
    #schedule_idとuser_idをチェックテーブルから探し、データを更新する処理。
    Check.where(schedule_id: params[:schedule_id], user_id: current_user.id).update(check_update_params)
    end
    redirect_to schedules_path
  end

  private
  def check_params
    params.require(:check).permit(:check).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end

  def check_update_params
    params.require(:check).permit(:check).merge(user_id: current_user.id)
  end

end