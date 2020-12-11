# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_9/part_2/solution.rb
module Day9
  class Part2
    attr_reader :file_name, :target
    attr_writer :data
    attr_accessor :value_list

    def initialize(test: false)
      @file_name = (test == true ? "test_input.txt" : "input.txt")
      @target = (test == true ? 127 : 1_309_761_972)
      @value_list = [data.shift]
    end

    # Day9::Part2.new.perform
    def perform
      process_value_list
    end

    private

    def data
      @data ||= File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n").map(&:to_i)
    end

    def process_value_list
      return value_list.min + value_list.max if value_sum == target

      if value_sum > target
        value_list.shift
      else
        return "No value found" if data.empty?

        value_list << data.shift
      end

      process_value_list
    end

    def value_sum
      value_list.sum
    end
  end
end
