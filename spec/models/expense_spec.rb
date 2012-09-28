# coding: utf-8
require 'spec_helper'

describe Expense do
  describe "#calc_daily" do
    context "date_unitが日単位の場合" do
      before(:each) do
        @water = Expense.create(
          :title => "Mineral Water", 
          :date_unit => Expense::DATE_UNIT_DAY, 
          :quantity => 2, 
          :amount => 100)
        @tirol_choco = Expense.create(
          :title => "Tirol Choco", 
          :date_unit => Expense::DATE_UNIT_DAY, 
          :quantity => 4, 
          :amount => 20)
      end
      it "は、１日あたりの金額を返すべき" do
        @water.calc_daily.should == 200
        @tirol_choco.calc_daily.should == 80
      end
    end
    
    context "date_unitが月単位の場合" do
      before(:each) do
        @gas = Expense.create(
          :title => "ガス料金", 
          :date_unit => Expense::DATE_UNIT_MONTH, 
          :quantity => 1, 
          :amount => 3650)
        
        @nomi = Expense.create(
          :title => "飲み会", 
          :date_unit => Expense::DATE_UNIT_MONTH, 
          :quantity => 4, 
          :amount => 3000)
      end
      it "は、１日あたりの金額を返すべき" do
        @gas.calc_daily.should == 120
        @nomi.calc_daily.should == 394
      end
    end
  end
end
