# frozen_string_literal: true

# add a method to the string class to check if input value is a number
class String
  def number?
    true if Float(self) rescue false
  end

  VALID_OPERATORS = ['+', '-', '*', '/'].freeze
  def operator?
    true if VALID_OPERATORS.include?(self)
  end

  def quit?
    true if downcase == 'q'
  end
end
