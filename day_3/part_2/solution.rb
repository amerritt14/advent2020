# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_3/part_2/solution.rb
module Day3
  class Part2
    def initialize(test: false)
      @test = test
    end

    # Day3::Part2.new.perform
    def perform
      slopes.map do |x, y|
        Day3::Part1.new(test: @test).perform(x, y)
      end.inject(:*)
    end

    def slopes
      [
        [1, -1],
        [3, -1],
        [5, -1],
        [7, -1],
        [1, -2]
      ]
    end
  end
end
