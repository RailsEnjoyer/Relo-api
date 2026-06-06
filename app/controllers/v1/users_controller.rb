# frozen_string_literal: true

class V1::UsersController < ApplicationController
  allow_unauthenticated_access only: [:create]

  def create
    service = Users::Create.call(user_params)
    return error_reponse(errors: service.errors) if service.failure?

    success_response(extra: service.result)
  end

  private

  def user_params
    params.expect(user: %i[email_address password password_confirmation])
  end
end
