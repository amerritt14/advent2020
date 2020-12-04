# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_4/part_2/solution.rb
# Day4::Part2.new.perform
module Day4
  class Part2 < Part1
    VALID_EYE_COLORS = %w(amb blu brn gry grn hzl oth).freeze

    private

    def valid?(passport)
      all_required_fields_present?(passport) &&
      REQUIRED_FIELDS.all?{ |field| send("#{field}_valid?", passport[field]) }
    end

    # individual field validations

    def byr_valid?(year)
      year.to_i.between?(1920, 2002)
    end

    def iyr_valid?(year)
      year.to_i.between?(2010, 2020)
    end

    def eyr_valid?(year)
      year.to_i.between?(2020, 2030)
    end

    def hgt_valid?(height)
      return hgt_cm_valid?(height.gsub("cm", "")) if height =~ /cm$/i
      return hgt_in_valid?(height.gsub("in", "")) if height =~ /in$/i

      false
    end

    def hgt_cm_valid?(height)
      height.to_i.between?(150, 193)
    end

    def hgt_in_valid?(height)
      height.to_i.between?(59, 76)
    end

    def hcl_valid?(hex_value)
      true if hex_value =~ /^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/i # I looked up the regex for validating color codes
    end

    def ecl_valid?(color)
      VALID_EYE_COLORS.include?(color)
    end

    def pid_valid?(id)
      id.size == 9
    end
  end
end
