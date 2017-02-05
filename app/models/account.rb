# frozen_string_literal: true
class Account < ApplicationRecord
  belongs_to :user
  belongs_to :account_type

  delegate :name, to: :account_type, prefix: true

  def active?
    deactive_at.nil? || dactive_at > Time.zone.now
  end
end
