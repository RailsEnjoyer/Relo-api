# frozen_string_literal: true

class V1::DashboardsController < ApplicationController
  def index
    relocation_plans =
      RelocationPlansSerializer.render_as_hash(current_user.relocation_plans.includes(:city))

    success_response(extra: { relocation_plans: })
  end
end
