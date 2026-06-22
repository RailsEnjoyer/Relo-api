# frozen_string_literal: true

class ListingsSerializer < Blueprinter::Base
  identifier :id

  fields :rent_price, :bedrooms, :bathrooms, :title, :image_urls

  view :index do
    fields :status, :longitude, :latitude

    field :match do |listing, options|
      Listings::MatchCalculator.call(listing:, plan: options[:plan]).result if options[:plan].present?
    end
  end
end
