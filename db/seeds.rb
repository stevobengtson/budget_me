# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  {name: 'Checking', budgetable: true},
  {name: 'Savings', budgetable: true},
  {name: 'Credit Card', budgetable: true},
  {name: 'Cash', budgetable: true},
  {name: 'Line of Credit', budgetable: true},
  {name: 'PayPal', budgetable: true},
  {name: 'Merchant Account', budgetable: true},
  {name: 'Investment Account', budgetable: false},
  {name: 'Mortgage', budgetable: false},
  {name: 'Other Asset', budgetable: false},
  {name: 'Other Liability', budgetable: false}
].each { |account_type| AccountType.find_or_create_by(name: account_type[:name], budgetable: account_type[:budgetable]) }

# Load seeds specific to the environment if any
seed_file = Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb")
load(seed_file) if File.exists?(seed_file)
