# frozen_string_literal: true

require_relative 'calculator'
require_relative 'string'

# provide opening message
puts 'Please enter a digit to start'

# create a new instance of the caculator
calc = Calculator.new

loop do
  # get value from the user. Call chomp to remove any new lines that could be in
  # the string. Call downcase so the user can do 'Q' or 'q' to quit.
  value = gets.chomp.downcase

  # quit the program if user types q
  if value.quit?
    puts 'goodbye'
    # use exit here because we don't want to loop to continue and run .input again
    exit
  end

  # perform the correct action based on the input value
  calc.input(value)
end
