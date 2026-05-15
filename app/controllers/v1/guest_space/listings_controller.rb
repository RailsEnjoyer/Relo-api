# frozen_string_literal: true

class V1::GuestSpace::ListingsController < ApplicationController
  def index
    Listing.order('RANDOM()').limit(3)
  end
end
