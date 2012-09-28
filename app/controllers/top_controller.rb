class TopController < ApplicationController
  def index
    @expenses = Expense.all
    @incomes = Income.all
  end
end
