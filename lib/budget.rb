require 'json'
require 'date'

class Budget

  attr_accessor :yearMonth, :amount

  def initialize(yearMonth, amount)
    @yearMonth = yearMonth
    @amount = amount
  end

  def days_in_month
    year  = yearMonth[0..3].to_i
    month = yearMonth[-2..-1].to_i
    Date.new(year, month, -1).day
  end
end
