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
          :amount => 100,
          :tax_flag => false)
        @tirol_choco = Expense.create(
          :title => "Tirol Choco",
          :date_unit => Expense::DATE_UNIT_DAY,
          :quantity => 4,
          :amount => 20,
          :tax_flag => false)
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
          :amount => 3650,
          :tax_flag => false)

        @nomi = Expense.create(
          :title => "飲み会",
          :date_unit => Expense::DATE_UNIT_MONTH,
          :quantity => 4,
          :amount => 3000,
          :tax_flag => false)
      end
      it "は、１日あたりの金額を返すべき" do
        @gas.calc_daily.should == 120
        @nomi.calc_daily.should == 394
      end
    end

    context "date_unitが年単位の場合" do
      before(:each) do
        @travel = Expense.create(
          :title => "旅行",
          :date_unit => Expense::DATE_UNIT_YEAR,
          :quantity => 2,
          :amount => 70000,
          :tax_flag => false)
        @movie = Expense.create(
          :title => "映画",
          :date_unit => Expense::DATE_UNIT_YEAR,
          :quantity => 10,
          :amount => 1800,
          :tax_flag => false)
      end
      it "は、１日あたりの金額を返すべき" do
        @travel.calc_daily.should == 383
        @movie.calc_daily.should == 49
      end
    end
    context "課税ありの場合" do
      before(:each) do
        @water = Expense.create(
          :title => "Mineral Water",
          :date_unit => Expense::DATE_UNIT_DAY,
          :quantity => 2,
          :amount => 100,
          :tax_flag => true)
      end
      it "は、１日あたりの金額を返すべき" do
        @water.calc_daily.should == 210
      end
    end
  end

  describe ".calc_all" do
    before(:each) do
      @water = Expense.create!(
        :title => "Mineral Water",
        :date_unit => Expense::DATE_UNIT_DAY,
        :quantity => 2,
        :amount => 100,
        :tax_flag => false)

      @gas = Expense.create!(
        :title => "ガス料金",
        :date_unit => Expense::DATE_UNIT_MONTH,
        :quantity => 1,
        :amount => 3650,
        :tax_flag => false)

      @travel = Expense.create!(
        :title => "旅行",
        :date_unit => Expense::DATE_UNIT_YEAR,
        :quantity => 2,
        :amount => 70000,
        :tax_flag => false)
    end
    it "は、１日あたりの合計金額を返すべき" do
      Expense.calc_all.should == 200 + 120 + 383
    end
  end
end
