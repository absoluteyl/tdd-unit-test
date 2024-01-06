require 'budget_repo'
require 'date'

class BudgetService

  attr_accessor :repo, :budgets

  def initialize(repo)
    @repo = repo
  end

  def query(start_date, end_date)
    @budgets = repo.getAll
    start_date_time = Date.parse(start_date)
    end_date_time = Date.parse(end_date)

    if start_date_time > end_date_time
      return 0
    end

    if start_date_time.year == end_date_time.year &&
      start_date_time.month == end_date_time.month

      month_budget= get_budget(start_date_time)

      days_in_month = month_budget.days_in_month

      if start_date_time.day == end_date_time.day
        return month_budget.amount.to_f / days_in_month
      end

      return month_budget.amount
    else
      last_budget = get_budget(end_date_time)
      days_in_last_month = last_budget.days_in_month
      last_month_days =  end_date_time.day

      first_budget = get_budget(start_date_time)
      days_in_first_month = first_budget.days_in_month
      first_month_days = days_in_first_month - start_date_time.day + 1


      return (last_budget.amount.to_f / days_in_last_month) * last_month_days + (first_budget.amount.to_f / days_in_first_month) * first_month_days
    end

    return 0
  end

  private

  def get_budget(date)
    budgets.find{ |b| b.yearMonth == date.strftime("%Y%m") }
  end
end
