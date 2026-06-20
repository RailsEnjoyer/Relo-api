# frozen_string_literal: true

class AddCoordinatesToRelocationPlans < ActiveRecord::Migration[8.1]
  def change
    change_table :relocation_plans, bulk: true do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
