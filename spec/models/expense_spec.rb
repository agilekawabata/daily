# coding: utf-8
require 'spec_helper'

describe Expense do
  describe "#calc_daily" do
    context "date_unitがdayの場合" do
      before(:each) do
        @water = Expense.new(
          :title => "Mineral Water", 
          :date_unit => Expense::DATE_UNIT_DAY, 
          :quantity => 2, 
          :amount => 100)
      end
      it "は、１日あたりの金額を返すべき" do
        @water.calc_daily.should == 200
      end
    end
  end
end
