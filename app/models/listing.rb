# frozen_string_literal: true

# == Schema Information
#
# Table name: listings
#
#  id               :bigint           not null, primary key
#  address          :string
#  amenities        :string           default([]), is an Array
#  available_from   :date
#  bathrooms        :decimal(3, 1)
#  bedrooms         :integer
#  buy_price        :decimal(10, 2)   default(0.0)
#  image_urls       :string           default([]), is an Array
#  landlord_contact :string
#  last_synced_at   :datetime
#  property_type    :integer          default(0), not null
#  rating           :integer
#  raw_payload      :jsonb
#  rent_price       :decimal(10, 2)   default(0.0)
#  sqft             :integer
#  status           :integer          default("available"), not null
#  title            :string           not null
#  url              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  neighborhood_id  :bigint
#
# Indexes
#
#  index_listings_on_neighborhood_id  (neighborhood_id)
#  index_listings_on_url              (url) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (neighborhood_id => neighborhoods.id)
#
class Listing < ApplicationRecord
  belongs_to :neighborhood

  enum :status, { available: 0, pending: 1, rented: 2, canceled: 3 }
end
