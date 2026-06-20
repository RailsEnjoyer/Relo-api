# frozen_string_literal: true

class V1::CitiesController < ApplicationController
  def index
    cities = Cities.where(state_id: params[:state_id])

    success_response(extra: { cities: CitiesSerializer.render_as_hash(cities), view: :index })
  end
end
