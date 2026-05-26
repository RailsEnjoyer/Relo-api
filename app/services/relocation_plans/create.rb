# frozen_string_literal: true

class RelocationPlans::Create < BaseService
  def initialize(data)
    @data = data
  end

  def call
    @result = create_relocation_plan
    self
  end

  private

  attr_reader :data

  def create_relocation_plan
    relocation_plan = RelocationPlan.create(data)

    return all_errors unless relocation_plan.persisted?

    {
      message: I18n.t('success.create.relocation_plan'),
      relocation_plan:
    }
  end

  def all_errors
    errors[:error_create_relocation_plan] = I18n.t('errors.create.relocation_plan')
  end
end
