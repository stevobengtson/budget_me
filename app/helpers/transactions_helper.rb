# frozen_string_literal: true
module TransactionsHelper
  def formatted_date(date = Time.zone.now)
    date.strftime("%A, %B #{date.day.ordinalize} %Y")
  end
end
