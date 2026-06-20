# frozen_string_literal: true

class AddCityToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :city, null: true, foreign_key: true
  end
end
