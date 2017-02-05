# frozen_string_literal: true
class AccountType < ApplicationRecord
  has_many :accounts
end
