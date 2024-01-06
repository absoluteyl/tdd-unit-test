require 'json'

class Budget

  attr_accessor :yearMonth, :amount

  def initialize(yearMonth, amount)
    @yearMonth = yearMonth
    @amount = amount
  end

  def to_hash
    { yearMonth: yearMonth, amount: amount }
  end

end
