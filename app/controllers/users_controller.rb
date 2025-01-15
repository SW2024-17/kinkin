class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]  # 新規登録は認証不要

  def new
    # 新規ユーザー登録フォーム
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    set_default_status(@user)  # ユーザーにデフォルトのステータスを設定
    if @user.save
      session[:user_id] = @user.id  # ユーザー登録後、ログイン状態にする
      redirect_to root_path, notice: 'ユーザーが作成されました。'
    else
      render :new
    end
  end

  def edit
    # ユーザー情報の編集フォーム
    @user = current_user
  end

  def update
    # ユーザー情報の更新処理
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報が更新されました。'
    else
      flash.now[:alert] = 'ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    # ユーザーの削除処理
    current_user.destroy
    session[:user_id] = nil  # ユーザー削除後にログアウトする
    redirect_to root_path, notice: 'ユーザーが削除されました。'
  end

  private
  
  def set_default_status(user)
    user.status ||= 'inactive'  # デフォルト値を設定（必要に応じて変更）
  end

  def user_params
    params.require(:user).permit(:user_id, :password, :password_confirmation, :name)
  end
end
