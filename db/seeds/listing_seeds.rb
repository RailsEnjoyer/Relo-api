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

house_images = [
  'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
  'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
  'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800',
  'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800',
  'https://images.unsplash.com/photo-1576941089067-2de3c901e126?w=800',
  'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800',
  'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800',
  'https://images.unsplash.com/photo-1513694203232-719a280e022f?w=800',
  'https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800',
  'https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=800'
]

apartment_images = [
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800',
  'https://images.unsplash.com/photo-1502672260266-1c1e525048c7?w=800',
  'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800',
  'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800',
  'https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?w=800'
]

neighborhoods.each do |neighborhood|
  rand(3..5).times do |i|
    prop_type = property_types.sample

    selected_images = if prop_type < 2
                        house_images.sample(2)
                      else
                        apartment_images.sample(2)
                      end

    is_rental = [true, false].sample

    listings << {
      neighborhood_id: neighborhood.id,
      url: "https://relo-fake-listing.com/#{neighborhood.id}-#{i}-#{SecureRandom.hex(4)}",
      title: "Beautiful #{prop_type < 2 ? 'Home' : 'Apartment'} in #{neighborhood.name}",
      address: "#{rand(100..9999)} #{address_array.sample}",
      rent_price: is_rental ? (rand(1500..6000) * 1.0).round(2) : nil,
      buy_price: is_rental ? nil : (rand(300_000..1_500_000) * 1.0).round(2),
      bedrooms: rand(1..4),
      bathrooms: bathrooms_count.sample,
      sqft: rand(500..2500),
      property_type: prop_type,
      available_from: Time.zone.now + rand(1..30).days,
      rating: rand(3..5),
      amenities: amenity_options.sample(rand(2..5)),
      status: statuses.sample,
      image_urls: selected_images,
      with_animals: [true, false].sample
    }
  end
end

Listing.create!(listings)
