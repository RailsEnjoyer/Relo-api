# frozen_string_literal: true

class V1::RelocationPlansController < ApplicationController
  # should be removed
  skip_before_action :verify_authenticity_token
  allow_unauthenticated_access

  def create
    data = RelocationPlans::DataHandler.call(params)
    return error_reponse(errors: data.errors) if data.failure?

    service = RelocationPlans::Create.call(data.result)
    return error_reponse(errors: service.errors) if service.failure?

    success_response(extra: service.result)
  end
end
