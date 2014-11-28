class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :days_high
      t.string :days_low
      t.string :market_cap

      t.timestamps
    end
  end
end
