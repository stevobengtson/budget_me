class String
  TRUE_VALUES = ['true', '1', 'yes', 'on', 't']

  def true?
    TRUE_VALUES.include? downcase
  end

  def false?
    !true?
  end
end