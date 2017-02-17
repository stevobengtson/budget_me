class DropCreditDebitTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :credit if ActiveRecord::Base.connection.column_exists?(:transactions, :credit)
    remove_column :transactions, :debit if ActiveRecord::Base.connection.column_exists?(:transactions, :debit)
  end
end
