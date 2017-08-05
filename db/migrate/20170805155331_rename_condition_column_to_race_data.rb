class RenameConditionColumnToRaceData < ActiveRecord::Migration
  def change
    rename_column :race_data, :condition, :baba_condition
  end
end
