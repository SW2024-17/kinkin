class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]  # ログイン関連では認証をスキップ

  def new
    # ログインフォームの表示
  end

  def create
    # ユーザーIDとパスワードで認証
    user = User.find_by(user_id: params[:user_id])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      user.update(last_sign_in_at: Time.current)  # 最後のサインイン時間を更新
      redirect_to root_path, notice: 'ログインしました。'
    else
      flash.now[:alert] = 'ユーザーIDまたはパスワードが正しくありません。'
      render :new
    end
  end

  def destroy
    # ログアウト処理
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end
