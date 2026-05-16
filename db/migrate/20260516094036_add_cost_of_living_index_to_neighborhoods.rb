# frozen_string_literal: true

class AddCostOfLivingIndexToNeighborhoods < ActiveRecord::Migration[8.1]
  def change
    add_column :neighborhoods, :cost_of_living_index, :integer
  end
end
