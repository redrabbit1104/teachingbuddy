class ChecksController < ApplicationController
  before_action :check_params, only: [:show, :edit, :destroy]
  before_action :check_update_params, only: :update

  def create
      check = Check.create(check_params)
      #処理後は元の画面に戻る
      redirect_back fallback_location: { action: "show", id: params[:id] }
  end

  def update
    #現在のユーザーがチェックテーブルのチェックをしたユーザーか否かによって保存処理ができるか出来ないかを分岐させる
    if current_user.id == Check.where(schedule_id: params[:schedule_id], user_id: current_user.id).pluck(:user_id)[0]
    #schedule_idとuser_idをチェックテーブルから探し、データを更新する処理。
    Check.where(schedule_id: params[:schedule_id], user_id: current_user.id).update(check_update_params)
      #更新時にCheckテーブルがチェック０を入れたまま更新した場合Confirmテーブル及びCheckテーブルから該当するデータを削除
      if Check.where(schedule_id: params[:schedule_id], user_id: current_user.id).pluck(:check)[0] == false
        Check.find(Check.where(schedule_id: params[:schedule_id], user_id: current_user.id).pluck(:id)[0]).destroy
        Confirm.find(Confirm.where(schedule_id: params[:schedule_id], user_id: current_user.id).pluck(:id)[0]).destroy
      end
    end
    #処理後は元の画面に戻る
    redirect_back fallback_location: { action: "show", id: params[:id] }
  end

  private
  def check_params
    params.require(:check).permit(:check).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end

  def check_update_params
    params.require(:check).permit(:check).merge(user_id: current_user.id)
  end

end