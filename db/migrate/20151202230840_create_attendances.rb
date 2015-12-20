class CreateAttendances < ActiveRecord::Migration
  def change
  	if (!table_exists? :attendances)
	    create_table :attendances do |t|
	      t.integer :user_id
	      t.date :date

	      t.timestamps
	    end
	end
  end
end
