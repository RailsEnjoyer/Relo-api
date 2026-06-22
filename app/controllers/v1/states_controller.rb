# frozen_string_literal: true

class V1::StatesController < ApplicationController
  def index
    success_response(extra: { states: StatesSerializer.render_as_hash(State.all, view: :index) })
  end
end
