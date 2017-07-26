class AddWeekIdToRaceData < ActiveRecord::Migration
  def change
    add_column :race_data, :week_id, :bigint
    add_column :race_data, :age_condition, :text
    add_column :race_data, :class_condition, :text
    add_column :race_data, :raceNumber, :string
    add_column :race_data, :race_kai, :tinyint
    add_column :race_data, :race_week, :tinyint
    add_column :race_data, :handi_cap, :string
  end
end
