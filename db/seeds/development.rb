# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# These seeds will only be loaded in development environments.
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating user'
test_user = User.find_or_create_by(email: 'test.user@budget.me') do |user|
  user.name = 'Test User'
  user.password = 'testpassword'
  user.password_confirmation = 'testpassword'
end

puts 'Populating accounts, category groups and categories'
user_populator = Populator::User.new(test_user)
user_populator.generate

puts 'Populating transactions'
transaction_populator = Populator::Transaction.new(test_user)
Faker::Number.between(50, 200).times.each { transaction_populator.generate }

puts 'Done'
