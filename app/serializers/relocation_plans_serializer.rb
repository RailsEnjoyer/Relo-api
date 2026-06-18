# frozen_string_literal: true

class RelocationPlansSerializer < Blueprinter::Base
  identifier :id

  fields :title, :monthly_rent_budget, :move_date

  view :index do
    field :top_matches do |plan|
      ListingsSerializer.render_as_hash(Current.user.top_matching_favorites(plan, limit: 2), view: :index, plan:)
    end
  end
end
