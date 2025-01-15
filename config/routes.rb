Rails.application.routes.draw do
  root 'top#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :destroy] do
    # 勤怠履歴のルーティングを追加
    get 'attendance_history', to: 'attendances#history', as: 'attendance_history'

    # 勤怠データ管理のルーティング
    resources :attendances, only: [:index, :new, :create, :edit, :update, :destroy] do
      patch 'check_out', on: :member
    end
  end

  # ログアウト用ルート
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
