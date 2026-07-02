# frozen_string_literal: true

class AddOfferTypeToListings < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :offer_type, :integer, null: false, default: 0
    add_index :listings, :offer_type
  end
end
