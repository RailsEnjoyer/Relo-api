# frozen_string_literal: true

class V1::ListingsController < ApplicationController
  def index
    pagy_obj, listings = pagy(Listing.all)
    serialized_listings = ListingsSerializer.render(listings, view: :index)

    success_response(
      extra: {
        listings: serialized_listings,
        meta: {
          current_page: pagy_obj.page,
          total_pages: pagy_obj.pages,
          total_count: pagy_obj.count
        }
      }
    )
  end
end
