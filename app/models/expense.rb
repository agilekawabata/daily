# coding: utf-8
class Expense < ActiveRecord::Base
  attr_accessible :amount, :date_unit, :quantity, :title
  
  DATE_UNIT_SELECTION = [["年", "year"], ["月", "month"], ["日", "day"]]
end
