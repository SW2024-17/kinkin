class User < ApplicationRecord
  has_secure_password  # パスワードの認証機能を提供
  has_many :attendances
  
  before_create :set_default_status

  public

  def status
    # 出勤中かどうかを判定するロジックをここに記述
    if last_sign_in_at.present? && last_sign_out_at.nil?
      "出勤中"
    elsif last_sign_out_at.present? && last_sign_in_at < last_sign_out_at
      "退勤済み"
    else
      "未出勤"
    end
  end

  validates :user_id, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end
