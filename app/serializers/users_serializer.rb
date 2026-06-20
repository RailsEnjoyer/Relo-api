# frozen_string_literal: true

class UsersSerializer < Blueprinter::Base
  identifier :id

  fields :email_address

  view :general do
    field :current_city do |e|
      e&.city&.name
    end

    field :current_state_code do |e|
      e&.state&.code
    end
  end
end
