# frozen_string_literal: true

class AddPropertyPreferencesToRelocationPlans < ActiveRecord::Migration[8.1]
  def change
    change_table :relocation_plans, bulk: true do |t|
      t.integer :bedrooms, null: true
      t.integer :bathrooms, null: true
      t.integer :sqft, null: true
      t.string :property_type, null: true
    end
  end
end
