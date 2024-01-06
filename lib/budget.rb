require 'json'

class Budget

  attr_accessor :yearMonth, :amount

  def initialize(yearMonth, amount)
    @yearMonth = yearMonth
    @amount = amount
  end
end
