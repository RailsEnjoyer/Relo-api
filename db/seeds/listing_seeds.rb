# frozen_string_literal: true

require 'securerandom'

Listing.destroy_all

neighborhoods = Neighborhood.all
property_types = [0, 1, 2, 3]
statuses = [0, 1]
amenity_options = ['Pool', 'Gym', 'Parking', 'Washer/Dryer', 'Balcony', 'Dishwasher', 'AC']

listings = []
address_array = ['Main St', 'Oak Ave', 'Pine Ln', 'Maple Dr']
bathrooms_count = [1.0, 1.5, 2.0, 2.5]

neighborhoods.each do |neighborhood|
  rand(3..5).times do |i|
    listings << {
      neighborhood_id: neighborhood.id,
      url: "https://relo-fake-listing.com/#{neighborhood.id}-#{i}-#{SecureRandom.hex(4)}",
      title: "Beautiful Home in #{neighborhood.name}",
      address: "#{rand(100..9999)} #{address_array.sample}",
      rent_price: (rand(1500..6000) * 1.0).round(2),
      buy_price: (rand(300_000..1_500_000) * 1.0).round(2),
      bedrooms: rand(1..4),
      bathrooms: bathrooms_count.sample,
      sqft: rand(500..2500),
      property_type: property_types.sample,
      available_from: Time.zone.now + rand(1..30).days,
      rating: rand(3..5),
      amenities: amenity_options.sample(rand(2..5)),
      status: statuses.sample,
      image_urls: [
        'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800',
        'https://images.unsplash.com/photo-1502672260266-1c1e525048c7?w=800'
      ]
    }
  end
end

Listing.create!(listings)
