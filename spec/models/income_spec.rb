# coding: utf-8
require 'spec_helper'

describe Income do
  describe "#calc_daily" do
    context "date_unitが日単位の場合" do
      before(:each) do
        @uriage = Income.create(
          :title => "チョコレートの売上", 
          :date_unit => Income::DATE_UNIT_DAY, 
          :quantity => 10, 
          :amount => 100)
      end
      it "は、１日あたりの金額を返すべき" do
        @uriage.calc_daily.should == 1000
      end
    end
    
    context "date_unitが月単位の場合" do
      before(:each) do
        @income = Income.create(
          :title => "給料", 
          :date_unit => Income::DATE_UNIT_MONTH, 
          :quantity => 1, 
          :amount => 300000)
        @part = Income.create(
          :title => "給料(嫁さんのパート)", 
          :date_unit => Income::DATE_UNIT_MONTH, 
          :quantity => 1, 
          :amount => 60000)
      end
      it "は、１日あたりの金額を返すべき" do
        @income.calc_daily.should == 9863
        @part.calc_daily.should == 1972
      end
    end
    
    context "date_unitが年単位の場合" do
      before(:each) do
        @otoshidama = Income.create(
          :title => "お年玉", 
          :date_unit => Income::DATE_UNIT_YEAR, 
          :quantity => 3, 
          :amount => 10000)
      end
      it "は、１日あたりの金額を返すべき" do
        @otoshidama.calc_daily.should == 82
      end
    end
  end
end
