# frozen_string_literal: true

# irb -r ./day_9/part_1/solution.rb
module Day9
  class Part1
    attr_reader :file_name, :preamble_length
    attr_writer :data

    def initialize(test: false)
      @file_name = (test === true ? "test_input.txt" : "input.txt")
      @preamble_length = (test === true ? 5 : 25)
    end

    # Day9::Part1.new.perform
    def perform
      parse_data
    end

    private

    def data
      @data ||= File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n")
    end

    def parse_data(array = data)
      return false if array.length <= preamble_length

      preamble = array[0, preamble_length].map(&:to_i)
      target = array[preamble_length].to_i

      if preamble.combination(2).to_a.any? { |x, y| x + y == target }
        array.shift
        parse_data(array)
      else
        target
      end
    end
  end
end
