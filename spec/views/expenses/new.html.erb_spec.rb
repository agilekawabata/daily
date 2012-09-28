require 'spec_helper'

describe "expenses/new" do
  before(:each) do
    assign(:expense, stub_model(Expense,
      :title => "MyString",
      :date_unit => "MyString",
      :quantity => 1,
      :amount => 1
    ).as_new_record)
  end

  it "renders new expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path, :method => "post" do
      assert_select "input#expense_title", :name => "expense[title]"
      assert_select "input#expense_date_unit", :name => "expense[date_unit]"
      assert_select "input#expense_quantity", :name => "expense[quantity]"
      assert_select "input#expense_amount", :name => "expense[amount]"
    end
  end
end
