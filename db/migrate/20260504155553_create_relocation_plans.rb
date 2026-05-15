# frozen_string_literal: true

class CreateRelocationPlans < ActiveRecord::Migration[8.1]
  def change
    create_table :relocation_plans do |t|
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.references :neighborhood, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title, index: true
      t.text :description
      t.integer :people_count, null: false, default: 1
      t.decimal :monthly_rent_budget, precision: 10, scale: 2, null: false, default: 0
      t.decimal :buy_budget, precision: 10, scale: 2, null: false, default: 0
      t.boolean :with_animals, null: false, default: false
      t.datetime :move_date
      t.string :must_haves, array: true, default: []
      t.string :deal_breakers, array: true, default: []
      t.string :priorities, array: true, default: []

      t.timestamps
    end
  end
end
