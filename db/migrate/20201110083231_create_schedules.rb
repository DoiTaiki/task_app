class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_day
      t.date :end_day
      t.text :memo
      
      t.timestamps
    end
  end
end
