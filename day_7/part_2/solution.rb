# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_7/part_2/solution.rb
module Day7
  class Part2 < Part1

    # Day7::Part2.new.perform
    def perform
      number_of_bags_in(MY_BAG)
    end

    private

    def number_of_bags_in(bag_name)
      return 0 if bag_name == "no other"

      rules[bag_name].map do |contained_bag_name, amount|
        amount + amount * number_of_bags_in(contained_bag_name)
      end.sum
    end
  end
end
