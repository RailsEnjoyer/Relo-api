class RelocationPlans::DataHandler < BaseService
  def initialize(params)
    @title = params[:title]
    @move_date = params[:move_date]
    @monthly_rent_budget = params[:monthly_rent_budget]
  end

  def call
    @result = validate_params
    self
  end

  private

  attr_reader :title, :move_date, :monthly_rent_budget

  def validate_params
    # todo

    {
      title:,
      move_date:,
      monthly_rent_budget:
    }
  end

  def validate_date
    # todo
  end
end
