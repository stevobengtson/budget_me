class AddAmountToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :amount, :decimal, default: 0.0
  end
end
