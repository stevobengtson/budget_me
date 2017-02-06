# frozen_string_literal: true
# Create a bung of transactions
100.times do
  amount = Faker::Number.between(-9999.99, 9999.99)
  Transaction.create(account: account, category: category,
                     occurred_at: Faker::Time.between(2.days.ago, Date.today, :all),
                     memo: Faker::Lorem.sentences(3).join(' '),
                     credit: (amount.positive? ? amount : nil), debit: (amount.positive? ? nil : amount))
end
