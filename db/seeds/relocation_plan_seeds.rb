# frozen_string_literal: true

RelocationPlan.destroy_all
Neighborhood.destroy_all
City.destroy_all
State.destroy_all

default_user = User.find_or_create_by!(email_address: 'r3ka1to@gmail.com') do |u|
  u.password = 'Password#123'
end

ca = State.create!(name: 'California', code: 'CA')
tx = State.create!(name: 'Texas', code: 'TX')
ny = State.create!(name: 'New York', code: 'NY')
fl = State.create!(name: 'Florida', code: 'FL')

sf = City.create!(state_id: ca.id, name: 'San Francisco')
la = City.create!(state_id: ca.id, name: 'Los Angeles')
austin = City.create!(state_id: tx.id, name: 'Austin')
nyc = City.create!(state_id: ny.id, name: 'New York City')
pensacola = City.create!(state_id: fl.id, name: 'Pensacola')

sf_mission = Neighborhood.create!(
  city_id: sf.id, name: 'Mission District',
  cost_of_living_index: 150,
  walkability_score: 100,
  crime_index: 110
)
la_weho = Neighborhood.create!(
  city_id: la.id,
  name: 'West Hollywood',
  cost_of_living_index: 155,
  walkability_score: 110,
  crime_index: 110
)
austin_downtown = Neighborhood.create!(
  city_id: austin.id,
  name: 'Downtown',
  cost_of_living_index: 100,
  walkability_score: 150,
  crime_index: 120
)
nyc_brooklyn = Neighborhood.create!(
  city_id: nyc.id,
  name: 'Brooklyn',
  cost_of_living_index: 140,
  walkability_score: 160,
  crime_index: 155
)
pensacola_downtown = Neighborhood.create!(
  city_id: pensacola.id,
  name: 'Downtown Pensacola',
  cost_of_living_index: 90,
  walkability_score: 85,
  crime_index: 100
)

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
  },
  {
    user_id: default_user.id,
    state_id: fl.id,
    city_id: pensacola.id,
    neighborhood_id: pensacola_downtown.id,
    title: 'Pensacola Beach Life',
    description: 'Looking to buy a place near the water in sunny Florida.',
    monthly_rent_budget: 0,
    buy_budget: 400_000.00,
    people_count: 2,
    with_animals: true,
    must_haves: %w[Balcony Pool],
    deal_breakers: ['No parking'],
    priorities: %w[Amenities Budget]
  }
]

RelocationPlan.create!(plans)
