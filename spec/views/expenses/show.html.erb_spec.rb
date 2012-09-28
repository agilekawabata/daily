require 'spec_helper'

describe "expenses/show" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :title => "Title",
      :date_unit => "Date Unit",
      :quantity => 1,
      :amount => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Date Unit/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
