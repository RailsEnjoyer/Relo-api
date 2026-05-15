# frozen_string_literal: true

class CreateNeighborhoods < ActiveRecord::Migration[8.1]
  def change
    create_table :neighborhoods do |t|
      t.references :city, null: false, foreign_key: true

      t.string :name, null: false
      t.text :description

      t.decimal :average_rent_price, precision: 10, scale: 2, null: false, default: 0
      t.decimal :average_buy_price, precision: 10, scale: 2, null: false, default: 0
      t.integer :crime_index
      t.integer :walkability_score
      t.integer :school_rating
      t.string :tags, array: true, default: []

      t.timestamps
    end

    add_index :neighborhoods, %i[city_id name], unique: true
  end
end
