# frozen_string_literal: true

CS.states(:us).each do |state_code, state_name|
  state = State.find_or_create_by!(name: state_name, code: state_code.to_s)

  CS.cities(state_code, :us).each do |city_name|
    City.find_or_create_by!(name: city_name, state_id: state.id)
  end
end
