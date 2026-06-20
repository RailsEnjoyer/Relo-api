# frozen_string_literal: true

class V1::ProfilesController < ApplicationController
  def show
    success_response(extra: { user: current_user })
  end

  def update
  end
end
