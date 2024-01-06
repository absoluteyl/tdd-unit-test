require 'budget_repo'
require 'time'

class BudgetService

  attr_accessor :repo

  def initialize(repo)
    @repo = repo
  end

  def query(start_date, end_date)
    budgets = repo.getAll

    start_date_time = Time.parse(start_date)
    end_date_time = Time.parse(end_date)

    if start_date_time.year == end_date_time.year && start_date_time.month == end_date_time.month
      return budgets.find{ |b| b.yearMonth == start_date_time.strftime("%Y%m") }.amount
    end

  end
end
