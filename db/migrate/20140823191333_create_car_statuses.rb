class CreateCarStatuses < ActiveRecord::Migration
  def change
    create_table :car_statuses do |t|
      t.string :carStatus

      t.timestamps
    end
  end
end
