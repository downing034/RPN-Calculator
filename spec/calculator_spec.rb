# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  before do
    @calc = Calculator.new
  end

  describe 'input' do
    it 'handles non valid characters' do
      $stdout = StringIO.new
      @calc.input 'r'
      expect($stdout.string.chomp).to eq "Invalid character... please enter a number, valid operator: '+', '-', '*', '/', or quit 'q'"
    end

    it 'handles not enough operands' do
      $stdout = StringIO.new
      @calc.input '5'
      @calc.input '+'
      expect($stdout.string.chomp).to eq 'Must have two operands to perform a calculation'
    end
  end

  # tests are setup with 4 digits to meet requirements
  describe 'calculate' do
    before do
      expect(@calc.instance_variable_get(:@input_values)).to eq []
      @calc.input '100'
      @calc.input '2'
      @calc.input '10'
      @calc.input '5'
      expect(@calc.instance_variable_get(:@input_values)).to eq [100, 2, 10, 5]
    end

    it 'properly adds' do
      @calc.input '+'
      expect(@calc.instance_variable_get(:@input_values)).to eq [117]
    end

    it 'stores subtracts' do
      @calc.input '-'
      expect(@calc.instance_variable_get(:@input_values)).to eq [83]
    end

    it 'stores multiplies' do
      @calc.input '*'
      expect(@calc.instance_variable_get(:@input_values)).to eq [100_00]
    end

    it 'stores divides' do
      @calc.input '/'
      expect(@calc.instance_variable_get(:@input_values)).to eq [1]
    end
  end
end
