class CreateOutstandingTransactions < ActiveRecord::Migration
  def change
    create_table :outstanding_transactions do |t|
      t.decimal :amount
      t.string :description
      t.string :other_party
      t.string :kind

      t.timestamps null: false
    end
  end
end
