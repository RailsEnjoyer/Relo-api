# frozen_string_literal: true

class ListingsSerializer < Blueprinter::Base
  identifier :id

  view :guest_index do
    fields :rent_price, :bedrooms, :bathrooms, :title, :image_urls
  end

  view :index do
    fields :rent_price, :bedrooms, :bathrooms, :title, :image_urls, :status
  end
end
