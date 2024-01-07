require 'json'
require 'date'

class Budget

  attr_accessor :year_month, :amount

  def initialize(year_month, amount)
    @year_month = year_month
    @amount = amount
  end

  def days_in_month
    year  = year_month[0..3].to_i
    month = year_month[-2..-1].to_i
    Date.new(year, month, -1).day
  end

  def daily_amount
    amount.to_f / days_in_month
  end
end
