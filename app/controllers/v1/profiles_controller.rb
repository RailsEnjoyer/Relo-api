# frozen_string_literal: true

class V1::ProfilesController < ApplicationController
  def show
    success_response(extra: { user: Current.session.user })
  end

  def update
  end
end
