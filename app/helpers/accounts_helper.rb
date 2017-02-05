# frozen_string_literal: true
module AccountsHelper
  def account_class(account)
    'danger' unless account.active?
  end
end
