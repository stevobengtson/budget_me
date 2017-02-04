# frozen_string_literal: true
class CreateAccountTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :account_types do |t|
      t.string :name
      t.boolean :budgetable

      t.timestamps
    end
  end
end
