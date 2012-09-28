require 'spec_helper'

describe "incomes/edit" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :title => "MyString",
      :date_unit => "MyString",
      :quantity => 1,
      :amount => 1
    ))
  end

  it "renders the edit income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomes_path(@income), :method => "post" do
      assert_select "input#income_title", :name => "income[title]"
      assert_select "input#income_date_unit", :name => "income[date_unit]"
      assert_select "input#income_quantity", :name => "income[quantity]"
      assert_select "input#income_amount", :name => "income[amount]"
    end
  end
end
