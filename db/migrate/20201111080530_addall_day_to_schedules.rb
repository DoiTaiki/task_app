class AddallDayToSchedules < ActiveRecord::Migration[6.0]
  def change
    remove_column :schedules, :all_day, :integer
    add_column :schedules, :all_day, :boolean
  end
end
