require 'spec_helper'

describe "expenses/index" do
  before(:each) do
    assign(:expenses, [
      stub_model(Expense,
        :title => "Title",
        :date_unit => "Date Unit",
        :quantity => 1,
        :amount => 2
      ),
      stub_model(Expense,
        :title => "Title",
        :date_unit => "Date Unit",
        :quantity => 1,
        :amount => 2
      )
    ])
  end

  it "renders a list of expenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Date Unit".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
