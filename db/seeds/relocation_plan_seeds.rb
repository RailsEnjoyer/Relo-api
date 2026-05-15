# frozen_string_literal: true

RelocationPlan.destroy_all
Neighborhood.destroy_all
City.destroy_all
State.destroy_all
User.destroy_all

default_user = User.create!(email_address: 'test@example.com', password: 'password')

ca = State.create!(name: 'California', code: 'CA')
tx = State.create!(name: 'Texas', code: 'TX')
ny = State.create!(name: 'New York', code: 'NY')

sf = City.create!(state_id: ca.id, name: 'San Francisco')
la = City.create!(state_id: ca.id, name: 'Los Angeles')
austin = City.create!(state_id: tx.id, name: 'Austin')
nyc = City.create!(state_id: ny.id, name: 'New York City')

sf_mission = Neighborhood.create!(city_id: sf.id, name: 'Mission District')
la_weho = Neighborhood.create!(city_id: la.id, name: 'West Hollywood')
austin_downtown = Neighborhood.create!(city_id: austin.id, name: 'Downtown')
nyc_brooklyn = Neighborhood.create!(city_id: nyc.id, name: 'Brooklyn')

plans = [
  {
    user_id: default_user.id,
    state_id: ca.id,
    city_id: sf.id,
    neighborhood_id: sf_mission.id,
    title: 'Move to SF Tech Hub',
    description: 'Looking for a spot close to startups and good coffee.',
    monthly_rent_budget: 3500.00,
    buy_budget: 0,
    people_count: 1,
    with_animals: false,
    must_haves: ['Fast internet', 'Close to transit'],
    deal_breakers: ['No AC', 'Carpet'],
    priorities: %w[Location Budget]
  },
  {
    user_id: default_user.id,
    state_id: ca.id,
    city_id: la.id,
    neighborhood_id: la_weho.id,
    title: 'Sunny LA Relocation',
    description: 'Need a pet-friendly apartment with a pool.',
    monthly_rent_budget: 2800.00,
    buy_budget: 0,
    people_count: 2,
    with_animals: true,
    must_haves: ['Pool', 'Pet friendly'],
    deal_breakers: ['No parking'],
    priorities: %w[Amenities Safety]
  },
  {
    user_id: default_user.id,
    state_id: tx.id,
    city_id: austin.id,
    neighborhood_id: austin_downtown.id,
    title: 'Austin Tech Relo',
    description: 'Moving for a new job, looking to buy soon.',
    monthly_rent_budget: 2000.00,
    buy_budget: 450_000.00,
    people_count: 2,
    with_animals: true,
    must_haves: %w[Gym Balcony],
    deal_breakers: ['Long commute'],
    priorities: ['Commute time', 'Space']
  },
  {
    user_id: default_user.id,
    state_id: ny.id,
    city_id: nyc.id,
    neighborhood_id: nyc_brooklyn.id,
    title: 'NYC Adventure',
    description: 'First time in New York, need to be near the subway.',
    monthly_rent_budget: 3200.00,
    buy_budget: 0,
    people_count: 1,
    with_animals: false,
    must_haves: %w[Doorman Elevator],
    deal_breakers: ['Walk-up'],
    priorities: %w[Location Safety]
  }
]

50.times do |i|
  city_record = [sf, la, austin, nyc].sample
  state_record = city_record.state
  neighborhood_record = Neighborhood.where(city: city_record).sample

  plans << {
    user_id: default_user.id,
    state_id: state_record.id,
    city_id: city_record.id,
    neighborhood_id: neighborhood_record.id,
    title: "Relocation to #{city_record.name} - Option #{i}",
    description: "Considering a move to #{city_record.name} area.",
    monthly_rent_budget: (rand(1500..5000) * 1.0).round(2),
    buy_budget: 0,
    people_count: rand(1..4),
    with_animals: [true, false].sample,
    must_haves: ['Parking', 'In-unit washer'].sample(rand(1..2)),
    deal_breakers: ['Shared laundry'],
    priorities: %w[Budget Safety]
  }
end

RelocationPlan.create!(plans)
