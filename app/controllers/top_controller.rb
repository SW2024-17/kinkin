class TopController < ApplicationController
  # 認証が不要なアクションでは authenticate_user! をスキップ
  skip_before_action :authenticate_user!, only: [:index]
  
  before_action :set_current_user

  def index
    # 現在ログイン中のユーザーの勤怠データを取得
    @attendances = current_user&.attendances&.order(check_in: :desc) if current_user
  end

  private

  # 現在ログイン中のユーザーを取得するヘルパーメソッド
  def set_current_user
    @current_user ||= current_user # もしログインしていたらcurrent_userをセット
  end
end
