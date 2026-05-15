# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[8.1]
  def change
    create_table :cities do |t|
      t.references :state, null: false, foreign_key: true

      t.string :name, null: false
      t.text :description

      t.integer :population
      t.integer :cost_of_living_index
      t.decimal :average_rent_price, precision: 10, scale: 2, null: false, default: 0
      t.decimal :average_buy_price, precision: 10, scale: 2, null: false, default: 0
      t.integer :walkability_score
      t.string :major_industries, array: true, default: []
      t.boolean :has_water_access, null: false, default: false

      t.string :natural_disasters, array: true, default: []
      t.integer :crime_index

      t.timestamps
    end

    add_index :cities, %i[state_id name], unique: true
  end
end
