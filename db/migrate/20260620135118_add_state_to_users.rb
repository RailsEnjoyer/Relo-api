# frozen_string_literal: true

class AddStateToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :state, null: true, foreign_key: true
  end
end
