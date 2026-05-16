# frozen_string_literal: true

class ListingsSerializer < Blueprinter::Base
  identifier :id

  view :guest_index do
    fields :buy_price, :rating, :sqft, :status, :title, :image_urls
  end
end
