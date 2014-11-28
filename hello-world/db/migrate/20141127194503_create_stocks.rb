class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.decimal :last_price, precision: 8,scale: 2
      t.decimal :days_high, precision: 8,scale: 2
      t.decimal :days_low, precision: 8,scale: 2
      t.string :market_cap
      t.string  :name
      t.string  :symbol
      t.integer :volume
      t.references :user, index: true

      t.timestamps
    end
  end
end