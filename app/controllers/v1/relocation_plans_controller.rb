# frozen_string_literal: true

class V1::RelocationPlansController < ApplicationController
  def create
    service = RelocationPlans::Create.call(params: relocation_plan_params, user: Current.user)
    return error_reponse(errors: service.errors) if service.failure?

    success_response(extra: service.result)
  end

  private

  def relocation_plan_params
    params.expect(
      relocation_plan: [
        :title, :move_date, :monthly_rent_budget, :buy_budget, :description,
        :people_count, :priorities, :with_animals, { deal_breakers: [], must_haves: [] }
      ]
    )
  end
end
