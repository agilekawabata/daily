class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.string :date_unit
      t.integer :quantity
      t.integer :amount

      t.timestamps
    end
  end
end
