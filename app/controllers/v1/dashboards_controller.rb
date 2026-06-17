# frozen_string_literal: true

class V1::DashboardsController < ApplicationController
  def index
    relocation_plans =
      RelocationPlansSerializer.render_as_hash(Current.session.user.relocation_plans, view: :index)

    success_response(extra: { relocation_plans: })
  end
end
