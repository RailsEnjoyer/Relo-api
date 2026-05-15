# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[8.1]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.decimal :income_tax_rate, precision: 5, scale: 2
      t.decimal :sales_tax_rate, precision: 5, scale: 2
      t.integer :cost_of_living_index
      t.decimal :average_rent_price, precision: 10, scale: 2, null: false, default: 0
      t.decimal :average_buy_price, precision: 10, scale: 2, null: false, default: 0

      t.integer :political_leaning, default: 0, null: false
      t.string :climate_category
      t.text :description

      t.string :natural_disasters, array: true, default: []
      t.boolean :has_water_access, null: false, default: false
      t.integer :crime_index

      t.timestamps

      t.index :code, unique: true
      t.index :name, unique: true
    end
  end
end
