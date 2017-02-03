# frozen_string_literal: true
class String
  TRUE_VALUES = %w(true 1 yes on t).freeze

  def true?
    TRUE_VALUES.include? downcase
  end

  def false?
    !true?
  end
end
