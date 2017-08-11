class CreateWinningRates < ActiveRecord::Migration
  def change
    create_table :winning_rates do |t|
      t.integer :name
      t.float :win_ratio
      t.float :top2_ratio
      t.float :top3_ratio

      t.timestamps null: false
    end
  end
end
