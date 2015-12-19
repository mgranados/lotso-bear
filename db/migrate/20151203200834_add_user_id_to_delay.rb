class AddUserIdToDelay < ActiveRecord::Migration
  def change
    add_column :delays, :user_id, :integer
  end
end
