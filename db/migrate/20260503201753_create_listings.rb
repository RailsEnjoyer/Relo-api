# frozen_string_literal: true

class CreateListings < ActiveRecord::Migration[8.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :listings do |t|
      t.references :neighborhood, foreign_key: true

      t.string :url
      t.string :title, null: false
      t.string :address
      t.decimal :rent_price, precision: 10, scale: 2, default: 0
      t.decimal :buy_price, precision: 10, scale: 2, default: 0
      t.integer :bedrooms
      t.decimal :bathrooms, precision: 3, scale: 1
      t.integer :sqft
      t.integer :property_type, default: 0, null: false
      t.date :available_from
      t.integer :rating
      t.string :landlord_contact
      t.string :amenities, array: true, default: []
      t.integer :status, default: 0, null: false

      t.string :image_urls, array: true, default: []

      t.jsonb :raw_payload, default: {}

      t.datetime :last_synced_at

      t.timestamps

      t.index :url, unique: true
    end
  end
end
