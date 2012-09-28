require 'spec_helper'

describe "expenses/edit" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :title => "MyString",
      :date_unit => "MyString",
      :quantity => 1,
      :amount => 1
    ))
  end

  it "renders the edit expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path(@expense), :method => "post" do
      assert_select "input#expense_title", :name => "expense[title]"
      assert_select "input#expense_date_unit", :name => "expense[date_unit]"
      assert_select "input#expense_quantity", :name => "expense[quantity]"
      assert_select "input#expense_amount", :name => "expense[amount]"
    end
  end
end
