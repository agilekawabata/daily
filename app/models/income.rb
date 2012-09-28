# coding: utf-8
class Income < ActiveRecord::Base
  attr_accessible :amount, :date_unit, :quantity, :title
  
  validates_presence_of :amount, :date_unit, :quantity, :title
  
  DATE_UNIT_YEAR = "year"
  DATE_UNIT_MONTH = "month"
  DATE_UNIT_DAY = "day"
  DATE_UNIT_SELECTION = [["年", DATE_UNIT_YEAR], ["月", DATE_UNIT_MONTH], ["日", DATE_UNIT_DAY]]
  
  def calc_daily
    case date_unit
    when DATE_UNIT_DAY
      amount * quantity
    when DATE_UNIT_MONTH
      amount * quantity * 12 / 365
    when DATE_UNIT_YEAR
      amount * quantity / 365
    end
  end
end
