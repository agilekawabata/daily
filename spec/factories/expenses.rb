# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    sequence(:title){|n| "Item #{n}"}
    date_unit {Expense::DATE_UNIT_SELECTION[rand(Expense::DATE_UNIT_SELECTION.size)][1]}
    quantity {rand(100)+1}
    amount {rand(1000)+1}
  end
  
  factory :daily_expense, :parent => :expense do
    sequence(:title){|n| "Daily Item #{n}"}
    date_unit Expense::DATE_UNIT_DAY
  end
  
  factory :monthly_expense, :parent => :expense do
    sequence(:title){|n| "Monthly Item #{n}"}
    date_unit Expense::DATE_UNIT_MONTH
  end
  
  factory :yearly_expense, :parent => :expense do
    sequence(:title){|n| "Yearly Item #{n}"}
    date_unit Expense::DATE_UNIT_YEAR
  end
end
