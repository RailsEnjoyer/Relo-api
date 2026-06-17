# frozen_string_literal: true

class RemoveDefaultsFromBudgets < ActiveRecord::Migration[8.1]
  def up
    change_table :relocation_plans, bulk: true do |t|
      t.change_default :buy_budget, nil
      t.change_default :monthly_rent_budget, nil

      t.change_null :buy_budget, true
      t.change_null :monthly_rent_budget, true
    end
  end

  def down
    change_table :relocation_plans, bulk: true do |t|
      t.change_default :buy_budget, 0.0
      t.change_default :monthly_rent_budget, 0.0

      t.change_null :buy_budget, false
      t.change_null :monthly_rent_budget, false
    end
  end
end
