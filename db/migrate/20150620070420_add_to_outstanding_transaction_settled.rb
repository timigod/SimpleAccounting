class AddToOutstandingTransactionSettled < ActiveRecord::Migration
  def change
    add_column :outstanding_transactions, :settled, :boolean, :default => false
  end
end
