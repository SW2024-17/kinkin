class AddUserIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_id, :string
  end
end
