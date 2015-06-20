class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :category_id
      t.string :description
      t.string :type
      t.date :date

      t.timestamps null: false
    end
  end
end
