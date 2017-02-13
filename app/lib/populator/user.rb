# frozen_string_literal: true
module Populator
  class User
    attr_reader :user

    def initialize(user = nil)
      @user = user
    end

    def generate
      create_user unless @user
      Faker::Number.between(1, 5).times.each { create_account }
      Faker::Number.between(1, 20).times.each { create_category_group }
    end

    private

    def create_user
      @user = User.find_or_create_by(email: Faker::Internet.email) do |user|
        user.name = Faker::Name.name
        user.password = user.password_confirmation = Faker::Internet.password
      end
    end

    def create_account
      create_user unless @user
      Account.find_or_create_by(user: @user, name: Faker::Lorem.word) do |account|
        account.note = Faker::Lorem.paragraph
        account.balance = Faker::Number.decimal(5, 2)
        account.account_type = account_type
      end
    end

    def create_category_group
      create_user unless @user
      group = CategoryGroup.find_or_create_by(user: @user, name: Faker::Lorem.word)
      Faker::Number.between(1, 20).times { create_category(group) }
    end

    def create_category(group)
      Category.find_or_create_by(category_group: group, name: Faker::Lorem.word)
    end

    def account_type
      @account_types ||= AccountType.all
      @account_types.sample
    end
  end
end
