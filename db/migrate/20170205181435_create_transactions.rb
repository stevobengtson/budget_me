class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.references :category, foreign_key: true
      t.datetime :occurred_at
      t.text :memo
      t.decimal :credit
      t.decimal :debit

      t.timestamps
    end
  end
end
