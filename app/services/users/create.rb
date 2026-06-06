# frozen_string_literal: true

class Users::Create < BaseService
  def initialize(data)
    @data = data
  end

  def call
    @result = create_user
    self
  end

  private

  attr_reader :data

  def create_user
    user = User.create(data)

    return all_errors(user) unless user.persisted?

    {
      message: I18n.t('success.create.user'),
      user:
    }
  end

  def all_errors(user)
    errors[:error_create_user] = I18n.t('errors.create.user')
    errors[:validation_errors] = user.errors.full_messages
  end
end
