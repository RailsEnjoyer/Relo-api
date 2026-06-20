# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint
#  state_id        :bigint
#
# Indexes
#
#  index_users_on_city_id        (city_id)
#  index_users_on_email_address  (email_address) UNIQUE
#  index_users_on_state_id       (state_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (state_id => states.id)
#
FactoryBot.define do
  factory :user do
    email_address { 'user@example.com' }
    password { 'password' }
  end
end
