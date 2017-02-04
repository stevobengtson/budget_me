# frozen_string_literal: true
class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :note
      t.decimal :balance
      t.timestamp :deactive_at
      t.integer :account_type_id

      t.timestamps
    end
  end
end
