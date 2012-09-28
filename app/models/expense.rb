class Expense < ActiveRecord::Base
  attr_accessible :amount, :date_unit, :quantity, :title
end
