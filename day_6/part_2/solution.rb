# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_6/part_2/solution.rb
module Day6
  class Part2 < Part1

    # Day6::Part2.new.perform
    def perform
      data.sum do |group|
        find_unanimous_answers(group).size
      end
    end

    private

    def find_unanimous_answers(group)
      group.split("\n").map do |member_answers|
        member_answers.split("")
      end.inject(:&)
    end
  end
end
