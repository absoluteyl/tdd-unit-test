class Budget

  attr_accessor :budget_data

  def new(yearMonth = nil, amount = nil)
    @budget_data ||= {}
    @budget_data[yearMonth] = amount if yearMonth
  end


  attr_accessor :yearMonth, :amount

  def new(yearMonth, amount)
    @yearMonth = yearMonth
    @amount = amount
  end

  # BUDGET = {
  #   '202401': 310,
  #   '202402': 2900
  # }

  # def yearMonth(date)
  #   BUDGET
  # end

  # def amount

  # end
end
