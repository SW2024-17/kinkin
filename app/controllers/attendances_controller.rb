class AttendancesController < ApplicationController
  # ログインユーザーの勤怠一覧
  def index
    @attendances = current_user.attendances.order(check_in: :desc)
  end
  
  def history
    @user = User.find(params[:user_id])
    @attendances = @user.attendances.order(check_in: :desc)
  end

  # 出勤処理のフォーム
  def new
    @user = User.find(params[:user_id]) # ユーザーを取得
    @attendance = @user.attendances.new # ネストされたattendanceを初期化
  end

  # 勤怠データを作成する
 def create
   @user = User.find(params[:user_id])
   existing_attendance = @user.attendances.find_by(check_out: nil)

   if existing_attendance
     redirect_to root_path, alert: '既に出勤中です。'
   else
     @attendance = @user.attendances.new(attendance_params)
     if @attendance.save
       @user.update!(status: "出勤中")
       redirect_to root_path, notice: '出勤登録が完了しました。'
     else
       render :new, status: :unprocessable_entity
     end
   end
 end


  private

  def attendance_params
    params.require(:attendance).permit(:check_in)
  end
end
