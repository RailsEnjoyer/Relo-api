# frozen_string_literal: true

class V1::SavedListingsController < ApplicationController
  def index
    pagy_obj, listings = pagy(Current.user.favorite_listings)
    serialized_listings = ListingsSerializer.render_as_hash(listings, view: :index)

    success_response(extra: { listings: serialized_listings, meta: default_meta(pagy_obj) })
  end

  def create
    saved_listing = Current.user.saved_listings.find_or_create_by(listing_id: params[:listing_id])
    success_response(extra: { saved_listing: })
  end

  def destroy
    Current.user.saved_listings.find_by(listing_id: params[:listing_id])&.destroy
    success_response
  end
end
