# frozen_string_literal: true

class StatesSerializer < Blueprinter::Base
  identifier :id

  view :index do
    fields :name, :code
  end
end
