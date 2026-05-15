# frozen_string_literal: true

class CreateUserListings < ActiveRecord::Migration[8.1]
  def change
    create_table :user_listings do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :relocation_plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.date :available_from
      t.integer :user_rating
      t.string :landlord_contact
      t.integer :status, default: 0, null: false
      t.text :notes
      t.text :pros
      t.text :cons

      t.string :additional_image_urls, array: true, default: []

      t.timestamps
    end

    add_index :user_listings, %i[relocation_plan_id listing_id], unique: true
  end
end
