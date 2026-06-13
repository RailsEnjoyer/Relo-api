# frozen_string_literal: true

state = State.find_or_create_by!(name: 'Florida', code: 'FL')
city = City.find_or_create_by!(name: 'Tampa', state: state)

50.times do
  Neighborhood.find_or_create_by!(
    name: Faker::Address.community,
    city: city
  ) do |n|
    n.average_buy_price = rand(300_000..2_000_000)
    n.average_rent_price = rand(1_200..5_000)
    n.cost_of_living_index = rand(80..150)
    n.crime_index = rand(10..90)
    n.description = Faker::Lorem.paragraph(sentence_count: 3)
    n.school_rating = rand(1.0..5.0).round(1)
    n.tags = %w[safe quiet vibrant family-friendly nightlife historic].sample(rand(1..3))
    n.walkability_score = rand(30..100)
  end
end
