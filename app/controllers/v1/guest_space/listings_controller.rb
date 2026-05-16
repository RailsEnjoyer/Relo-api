# frozen_string_literal: true

class V1::GuestSpace::ListingsController < ApplicationController
  allow_unauthenticated_access

  def index
    listings = Listing.limit(10)

    render json: ListingsSerializer.render(listings, view: :guest_index)
  end
end
