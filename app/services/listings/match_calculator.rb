# frozen_string_literal: true

class Listings::MatchCalculator < BaseService
  include Listings::PropertyComparisonWeights

  def initialize(listing:, plan:)
    @listing = listing
    @plan = plan
  end

  def call
    @result = total_match_score
    self
  end

  private

  attr_reader :listing, :plan

  def total_match_score
    score = [
      budget_score,
      location_score,
      space_score,
      features_score
    ].sum - deal_breakers_penalty - property_type_penalty - animals_penalty

    score.clamp(0, 100)
  end

  def budget_score
    if listing.buy_price.present?
      listing_price = listing.buy_price
      plan_budget = plan.buy_budget
    else
      listing_price = listing.rent_price
      plan_budget = plan.monthly_rent_budget
    end

    return 0 if plan_budget.nil? || listing_price.nil?
    return MAX_BUDGET_SCORE if plan_budget >= listing_price
    return MAX_BUDGET_SCORE / 2 if plan_budget * 1.2 >= listing_price

    0
  end

  # The KISS approach was consciously chosen over metaprogramming
  def location_score
    return match_neighborhood_level if plan.neighborhood_id.present?
    return match_city_level if plan.city_id.present?
    return match_state_level if plan.state_id.present?

    MAX_LOCATION_SCORE
  end

  def match_neighborhood_level
    return MAX_LOCATION_SCORE if plan.neighborhood_id == listing.neighborhood_id
    return MAX_LOCATION_SCORE / 2 if plan.city_id == listing.city_id
    return MAX_LOCATION_SCORE / 5 if plan.state_id == listing.state_id

    0
  end

  def match_city_level
    return MAX_LOCATION_SCORE if plan.city_id == listing.city_id
    return MAX_LOCATION_SCORE / 2 if plan.state_id == listing.state_id

    0
  end

  def match_state_level
    plan.state_id == listing.state_id ? MAX_LOCATION_SCORE : 0
  end

  def space_score
    return MAX_SPACE_SCORE if plan.sqft.nil?

    return MAX_SPACE_SCORE if listing.sqft >= plan.sqft
    return MAX_SPACE_SCORE / 2 if listing.sqft * 1.2 >= plan.sqft

    0
  end

  def features_score
    return MAX_FEATURES_SCORE if plan.must_haves.empty?

    matched = plan.must_haves & listing.amenities
    score_per_feature = MAX_FEATURES_SCORE.to_f / plan.must_haves.size

    (matched.size * score_per_feature).round
  end

  def deal_breakers_penalty
    return 0 if plan.deal_breakers.empty?

    matched_deal_breakers = plan.deal_breakers & listing.amenities
    return 0 if matched_deal_breakers.empty?

    DEAL_BREAKER_PENALTY * matched_deal_breakers.size
  end

  def property_type_penalty
    return 0 if plan.property_type.nil?
    return PROPERTY_TYPE_PENALTY unless plan.property_type == listing.property_type

    0
  end

  def animals_penalty
    return 0 unless plan.with_animals

    listing.with_animals ? 0 : ANIMALS_PENALTY
  end
end
