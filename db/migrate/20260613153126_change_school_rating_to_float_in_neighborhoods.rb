# frozen_string_literal: true

class ChangeSchoolRatingToFloatInNeighborhoods < ActiveRecord::Migration[8.1]
  def up
    change_column :neighborhoods, :school_rating, :float, using: 'school_rating::float'
  end

  def down
    change_column :neighborhoods, :school_rating, :integer, using: 'school_rating::integer'
  end
end
