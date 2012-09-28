require 'spec_helper'

describe "incomes/show" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
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
