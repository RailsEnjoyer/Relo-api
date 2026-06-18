# frozen_string_literal: true

class AddWithAnimalsToListings < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :with_animals, :boolean, default: false, null: false
  end
end
