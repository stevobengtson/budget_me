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
      ::Transaction.create(
        account: account,
        category: category,
        occurred_at: Faker::Date.between(2.years.ago, Date.today),
        memo: Faker::Lorem.sentence,
        amount: amount
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
      value = Faker::Number.decimal(5, 2).to_f
      credit = Faker::Boolean.boolean
      credit ? value : (value * -1.0)
    end
  end
end
