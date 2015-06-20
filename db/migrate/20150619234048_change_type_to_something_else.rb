class ChangeTypeToSomethingElse < ActiveRecord::Migration
  def change
    rename_column :transactions, :type, :kind
  end
end
