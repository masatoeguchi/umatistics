class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.integer :tansyo_num, :limit => 2
      t.integer :tansyo_return
      t.integer :fukusyo_num1, :limit => 2
      t.integer :fukusyo_num2, :limit => 2
      t.integer :fukusyo_num3, :limit => 2
      t.integer :fukusyo_return1
      t.integer :fukusyo_return2
      t.integer :fukusyo_return3
      t.integer :wide_num1_1, :limit => 2
      t.integer :wide_num1_2, :limit => 2
      t.integer :wide_num2_1, :limit => 2
      t.integer :wide_num2_2, :limit => 2
      t.integer :wide_num3_1, :limit => 2
      t.integer :wide_num3_2, :limit => 2
      t.integer :wide_return1
      t.integer :wide_return2
      t.integer :wide_return3
      t.integer :wakuren_num1, :limit => 2
      t.integer :wakuren_num2, :limit => 2
      t.integer :wakuren_return
      t.integer :umaren_num1, :limit => 2
      t.integer :umaren_num2, :limit => 2
      t.integer :umaren_return
      t.integer :umatan_num1, :limit => 2
      t.integer :umatan_num2, :limit => 2
      t.integer :umatan_return
      t.integer :sanrenpuku_num1, :limit => 2
      t.integer :sanrenpuku_num2, :limit => 2
      t.integer :sanrenpuku_num3, :limit => 2
      t.integer :sanrenpuku_return
      t.integer :sanrentan_num1, :limit => 2
      t.integer :sanrentan_num2, :limit => 2
      t.integer :sanrentan_num3, :limit => 2
      t.integer :sanrentan_return
      t.integer :week_id, :limit => 8

      t.timestamps null: false
    end
  end
end
