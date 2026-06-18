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
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :relocation_plans, dependent: :destroy
  has_many :saved_listings, dependent: :destroy
  has_many :favorite_listings, through: :saved_listings, source: :listing

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def top_matching_favorites(plan, limit: 2)
    favorite_listings.to_a.sort_by do |listing|
      -Listings::MatchCalculator.call(listing:, plan:).result
    end.first(limit)
  end
end
