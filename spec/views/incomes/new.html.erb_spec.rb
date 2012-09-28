require 'spec_helper'

describe "incomes/new" do
  before(:each) do
    assign(:income, stub_model(Income,
      :title => "MyString",
      :date_unit => "MyString",
      :quantity => 1,
      :amount => 1
    ).as_new_record)
  end

  it "renders new income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomes_path, :method => "post" do
      assert_select "input#income_title", :name => "income[title]"
      assert_select "input#income_date_unit", :name => "income[date_unit]"
      assert_select "input#income_quantity", :name => "income[quantity]"
      assert_select "input#income_amount", :name => "income[amount]"
    end
  end
end
