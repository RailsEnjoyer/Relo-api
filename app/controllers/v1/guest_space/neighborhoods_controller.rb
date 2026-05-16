# frozen_string_literal: true

class V1::GuestSpace::NeighborhoodsController < ApplicationController
  allow_unauthenticated_access

  def index
    neighborhoods = Neighborhood.order('RANDOM()').limit(3)

    render json: NeighborhoodsSerializer.render(neighborhoods, view: :guest_index)
  end
end
