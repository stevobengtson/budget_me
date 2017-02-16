# frozen_string_literal: true
class Account < ApplicationRecord
  belongs_to :user
  belongs_to :account_type
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :account_type, presence: true
  validates :name, uniqueness: {scope: :user, message: 'Account names should be unique'}

  delegate :name, to: :account_type, prefix: true

  def active?
    deactive_at.nil? || dactive_at > Time.zone.now
  end
end
