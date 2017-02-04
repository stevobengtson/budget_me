# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AccountType.create([
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
                   ])
