# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_5/part_2/solution.rb
module Day5
  class Part2 < Part1

    # Day5::Part2.new.perform
    def perform
      expected_sum_of_seat_ids - sum_of_seat_ids
    end

    private

    def sum_of_seat_ids
      seat_ids.sum
    end

    def expected_sum_of_seat_ids
      sum_of_first_n_ints(seat_ids.max) - sum_of_first_n_ints(seat_ids.min - 1)
    end

    def seat_ids
      @seat_ids ||= rows_and_columns_by_seat_id.keys.sort
    end

    def sum_of_first_n_ints(num)
      (num * (num + 1)) / 2
    end
  end
end
