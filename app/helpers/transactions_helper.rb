# frozen_string_literal: true
module TransactionsHelper
  def formatted_date(date = Time.zone.now)
    date.strftime("%A, %B #{date.day.ordinalize} %Y")
  end

  def list_date(date = Time.zone.now)
    if date > Time.zone.now.beginning_of_month
      date.strftime('%b %-d') 
    else
      date.to_s(:date_only)
    end
  end

  def currency(value = 0.00)
    number_to_currency(value.to_f, precision: 2, negative_format: '-%u%n').to_s
  end

  def amount_color(value = 0.00)
    value.positive? ? 'text-success' : 'text-danger'
  end
end
