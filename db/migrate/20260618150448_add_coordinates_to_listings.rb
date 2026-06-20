# frozen_string_literal: true

class AddCoordinatesToListings < ActiveRecord::Migration[8.1]
  def change
    change_table :listings, bulk: true do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
