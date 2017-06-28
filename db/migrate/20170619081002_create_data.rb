class CreateData < ActiveRecord::Migration
  def change
    create_table :race_data do |t|
      t.string :name
      t.integer :order
      t.integer :wakuban
      t.integer :umaban
      t.float :odds
      t.integer :popular
      t.string :sex
      t.integer :age
      t.integer :burden
      t.string :jockey
      t.float :time
      t.string :trainer
      t.integer :weight
      t.integer :w_diff
      t.integer :pass3
      t.integer :pass4
      t.float :l3
      t.string :racePlace
      t.string :condition
      t.integer :length
      t.datetime :date

      t.timestamps null: false
    end
  end
end
