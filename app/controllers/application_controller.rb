# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token, raise: false


  stale_when_importmap_changes

  private

  def error_reponse(errors:, status: :unprocessable_content, extra: nil)
    render json: { status: 'error', errors:, extra: }, status:
  end

  def success_response(status: :ok, extra: nil)
    render json: { status: 'success', extra: }, status:
  end
end
