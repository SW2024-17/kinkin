class ApplicationController < ActionController::Base
   helper_method :current_user # ビューでcurrent_userメソッドを使えるようにする
  # ユーザーがログインしていない場合、ログインページにリダイレクトする
  before_action :authenticate_user!

  private

  def authenticate_user!
    # セッションの user_id に基づいてユーザーを探し、存在しなければログインページにリダイレクト
    redirect_to new_session_path, alert: 'ログインしてください。' unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
