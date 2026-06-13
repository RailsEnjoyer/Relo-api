# frozen_string_literal: true

class V1::DashboardsController < ApplicationController
  def index
    success_response(extra: { relocation_plans: Current.session.user.relocation_plans })
  end
end
