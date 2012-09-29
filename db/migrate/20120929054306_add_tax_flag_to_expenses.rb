class AddTaxFlagToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :tax_flag, :boolean, :default => false
  end
end
