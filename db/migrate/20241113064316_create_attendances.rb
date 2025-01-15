class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.datetime :check_in
      t.datetime :check_out
      t.string :status

      t.timestamps
    end
  end
end
