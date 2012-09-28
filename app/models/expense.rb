# coding: utf-8
class Expense < ActiveRecord::Base
  attr_accessible :amount, :date_unit, :quantity, :title
  
  validates_presence_of :amount, :date_unit, :quantity, :title
  
  DATE_UNIT_YEAR = "year"
  DATE_UNIT_MONTH = "month"
  DATE_UNIT_DAY = "day"
  DATE_UNIT_SELECTION = [["年", DATE_UNIT_YEAR], ["月", DATE_UNIT_MONTH], ["日", DATE_UNIT_DAY]]
  
  def calc_daily
    amount * quantity
  end
end
