# frozen_string_literal: true

class RelocationPlans::DataHandler < BaseService
  def initialize(params)
    @params = params
  end

  def call
    @result = validate_params
    self
  end

  private

  attr_reader :params

  def validate_params
    # todo

    {
      title: params[:title],
      move_date: params[:move_date],
      monthly_rent_budget: params[:monthly_rent_budget],
      buy_budget: params[:buy_budget],
      description: params[:description],
      people_count: params[:people_count],
      priorities: params[:priorities],
      with_animals: params[:with_animals],
      must_haves: params[:must_haves],
      deal_breakers: params[:deal_breakers]
    }
  end

  def validate_date
    # todo
  end
end
