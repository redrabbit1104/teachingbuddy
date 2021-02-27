class ConfirmsController < ApplicationController
  before_action :confirms_params, only: [:switch]
  
  def switch
      #confirmテーブルにユーザーidが存在しない場合は、新たにチェックを入れるとしてcheck値をテーブルに生成する
      if Confirm.where(user_id:params[:user_id], schedule_id:params[:id]).blank?
      @switch = "post"
      Confirm.create(confirms_params)
      redirect_to  preview_schedule_path
      else
      #confirmテーブルにユーザーidが存在する場合はcheckの更新を行う
      @switch = "patch"
      Confirm.where(user_id:params[:user_id],schedule_id: params[:id]).update(confirms_params)
      redirect_to  preview_schedule_path
      end
  end

  private
  def confirms_params
    params.permit(:check).merge(admin_id: current_admin.id, schedule_id: params[:id], user_id: params[:user_id])
  end
end
