require 'budget_repo'
require 'date'

class BudgetService

  attr_accessor :repo

  def initialize(repo)
    @repo = repo
  end

  def query(start_date, end_date)
    budgets = repo.getAll

    start_date_time = Date.parse(start_date)
    end_date_time = Date.parse(end_date)

    if start_date_time > end_date_time
      return 0
    end

    if start_date_time.year == end_date_time.year &&
      start_date_time.month == end_date_time.month

      month_budget = budgets.find{ |b| b.yearMonth == start_date_time.strftime("%Y%m") }.amount

      days_in_month = days_in_month(start_date_time)

      if start_date_time.day == end_date_time.day
        return month_budget.to_f / days_in_month
      end

      return month_budget
    else
      last_budget = budgets.find{ |b| b.yearMonth == end_date_time.strftime("%Y%m") }.amount
      days_in_last_month = days_in_month(end_date_time)
      last_month_days =  end_date_time.day

      first_budget = budgets.find{ |b| b.yearMonth == start_date_time.strftime("%Y%m") }.amount
      days_in_first_month = days_in_month(start_date_time)
      first_month_days = days_in_first_month - start_date_time.day + 1


      return (last_budget.to_f / days_in_last_month) * last_month_days + (first_budget.to_f / days_in_first_month) * first_month_days
    end

    return 0
  end

  private

  def days_in_month(date)
    Date.new(date.year, date.month, -1).day
  end
end
