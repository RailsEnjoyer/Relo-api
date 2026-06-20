# frozen_string_literal: true

class CitiesSerializer < Blueprinter::Base
  identifier :id

  view :index do
    fields :name
  end
end
