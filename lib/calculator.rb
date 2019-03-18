# frozen_string_literal: true

require_relative 'string'

# class used to do basic math calculations using RPN notation
class Calculator
  # create an empty array to start storing STDIN values in
  def initialize
    @input_values = []
  end

  def input(value)
    # if the value is a number, add it to the array for later use
    if value.number?
      @input_values.push(value.to_i)

    # check if value is an operator
    elsif value.operator?
      # if the value is an operator, there must be at least two numbers (operands)
      # to calculate. If there isn't provide the user with feedback
      if @input_values.length < 2
        # if you wanted the program to exit on bad input, I could see raising an
        # error here. I've chosen, however, to allow the user a second chance. Return
        # so the function doesn't try to calculate
        puts 'Must have two operands to perform a calculation'
        return
      end
      # perform the calculation
      calculate(value)

    # return a helpful message if the user enters a character that the program
    # does not use.
    else
      puts "Invalid character... please enter a number, valid operator: '+', '-', '*', '/', or quit 'q'"
    end
  end

  def calculate(value)
    case value
    # when the value is '+' add each number in the array and return the output
    when '+'
      output = @input_values.inject { |sum, n| sum + n }

    # when the value is '-' subtract each number in the array and return the output
    when '-'
      output = @input_values.inject { |difference, n| difference - n }

    # when the value is '*' multiply each number in the array and return the output
    when '*'
      output = @input_values.inject { |product, n| product * n }

      # when the value is '/' divide each number in the array adn return the output
    when '/'
      output = @input_values.inject { |quotient, n| quotient / n }
    # this code path can't be hit, but it's not a good idea to do an else for the
    # last operator just in case the code changes down the road
    else
      raise 'Invalid operator'
    end

    # set the input_values array equal to the output of the case statement. This will
    # give us the proper outcome, allow it to be used in future calculations, and
    # effective remove old values from the array that are no longer needed.
    @input_values = [output]
    puts "= #{output}"
  end
end
