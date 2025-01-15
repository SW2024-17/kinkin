class AddSignInOutTimestampsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :last_sign_out_at, :datetime
  end
end
