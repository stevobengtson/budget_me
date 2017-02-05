# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# These seeds will only be loaded in development environments.
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.find_or_create_by(email: 'test.user@budget.me') do |user|
  user.name = 'Test User'
  user.password = 'testpassword'
  user.password_confirmation = 'testpassword'
end

Account.find_or_create_by(user: test_user, name: 'Test Account') do |account|
  account.note = 'This is a test account'
  account.account_type = AccountType.find_by(name: 'Checking')
end

Account.find_or_create_by(user: test_user, name: 'Test Accoun 2t') do |account|
  account.note = 'This is another test account'
  account.account_type = AccountType.find_by(name: 'Saving')
end

test_category_group = CategoryGroup.find_or_create_by(user: test_user, name: 'Test Category')

Category.find_or_create_by(category_group: test_category_group, name: 'First Category')
Category.find_or_create_by(category_group: test_category_group, name: 'Second Category')
Category.find_or_create_by(category_group: test_category_group, name: 'Third Category')
