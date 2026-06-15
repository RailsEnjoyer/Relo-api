# frozen_string_literal: true

class RelocationPlans::Create < BaseService
  def initialize(params:, user:)
    @params = params
    @user = user
  end

  def call
    @result = create_relocation_plan
    self
  end

  private

  attr_reader :params, :user

  def create_relocation_plan
    relocation_plan = RelocationPlan.create(params.merge(user:))

    errors[:validation_error] = relocation_plan.errors unless relocation_plan.persisted?

    {
      message: I18n.t('success.create.relocation_plan'),
      relocation_plan:
    }
  end
end
