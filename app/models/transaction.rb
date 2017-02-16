# frozen_string_literal: true
class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  validates :occurred_at, presence: true
  validates :account, presence: true

  delegate :user, to: :account
  delegate :name, to: :account, prefix: true
  delegate :name, to: :category, prefix: true

  after_initialize :init

  scope :for_account, ->(account) {where(account: account) if account.present?}

  def amount
    credit_value.zero? ? debit_value : credit_value
  end

  def amount=(val)
    credit = val if val.positive?
    debit = (val * -1) if val.negative?
  end

  def full_category
    "#{category.category_group_name}:#{category_name}"
  end

  private

  def credit_value
    credit.nil? ? 0.00 : credit
  end

  def debit_value
    debit.nil? ? 0.00 : (debit * -1)
  end

  def init
    self.occurred_at ||= Time.zone.now.beginning_of_day
  end
end
