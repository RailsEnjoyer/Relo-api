# frozen_string_literal: true

class NeighborhoodsSerializer < Blueprinter::Base
  identifier :id

  view :guest_index do
    field :neighborhood_name do |e|
      e.name
    end

    field :neighborhood_cost_of_living do |e|
      e.cost_of_living_index
    end

    field :neighborhood_crime_index do |e|
      e.crime_index
    end

    field :neighborhood_walkability_score do |e|
      e.walkability_score
    end
  end
end
