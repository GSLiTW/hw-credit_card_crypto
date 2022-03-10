# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    check_digit = nums_a.pop

    # TODO: use the integers in nums_a to validate its last check digit
    sum_a = nums_a.reverse.each_with_index.map.reduce(0) do |sum, (element, index)|
      sum + if index.odd?
              element
            else
              (element * 2 == 18 ? 9 : ((element * 2) % 9))
            end
    end

    ((10 - (sum_a % 10)) % 10) == check_digit
  end
end
