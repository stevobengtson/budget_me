# frozen_string_literal: true
module Populator
  class Transaction
    attr_reader :user

    def initialize(user)
      raise ArgumentError, 'User required' unless user.is_a?(::User)
      @user = user
      @category_groups = @user.category_groups
      @accounts = @user.accounts
    end

    def generate
      credit_value, debit_value = amount
      ::Transaction.create(
        account: account,
        category: category,
        occurred_at: Faker::Date.between(2.years.ago, Date.today),
        memo: Faker::Lorem.sentence,
        credit: credit_value,
        debit: debit_value
      )
    end

    private

    def account
      @accounts.sample
    end

    def category
      category_group = @category_groups.sample
      category_group.categories.sample
    end

    def amount
      credit = Faker::Boolean.boolean
      credit_value = credit ? Faker::Number.decimal(5, 2) : nil
      debit_value = credit ? nil : Faker::Number.decimal(5, 2)
      [credit_value, debit_value]
    end
  end
end
