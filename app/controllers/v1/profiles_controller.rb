# frozen_string_literal: true

class V1::ProfilesController < ApplicationController
  def show
    user = UsersSerializer.render_as_hash(current_user, view: :general)
    success_response(extra: { user: })
  end

  def update
  end
end
