# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint
#  state_id        :bigint
#
# Indexes
#
#  index_users_on_city_id        (city_id)
#  index_users_on_email_address  (email_address) UNIQUE
#  index_users_on_state_id       (state_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (state_id => states.id)
#
class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :relocation_plans, dependent: :destroy
  has_many :saved_listings, dependent: :destroy
  has_many :favorite_listings, through: :saved_listings, source: :listing

  belongs_to :city, optional: true
  belongs_to :state, optional: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def top_matching_favorites(plan, limit: 2)
    favorite_listings.to_a.sort_by do |listing|
      -Listings::MatchCalculator.call(listing:, plan:).result
    end.first(limit)
  end
end
