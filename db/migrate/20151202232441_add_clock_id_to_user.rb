class AddClockIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :clock_id, :integer
  end
end
