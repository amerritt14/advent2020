# frozen_string_literal: true

# irb -r ./day_5/part_1/solution.rb
module Day5
  class Part1
    attr_accessor :test
    attr_writer :data

    def initialize(test: false)
      @test = test
    end

    # Day5::Part1.new.perform
    def perform
      rows_and_columns_by_seat_id.keys.max
    end

    private

    def rows_and_columns_by_seat_id
      data.map do |code|
        binary_string = convert_to_binary(code)
        row = find_row(binary_string)
        col = find_col(binary_string)
        seat_id = (row * 8) + col
        [seat_id, [row, col]]
      end.to_h
    end

    def find_row(str)
      str[0..6].to_i(2)
    end

    def find_col(str)
      str[7..-1].to_i(2)
    end

    def convert_to_binary(str)
      str.upcase.gsub("L", "0").gsub("R", "1").gsub("F", "0").gsub("B", "1")
    end

    def data
      return @data unless @data.nil?

      file_name = (test === true ? "test_input.txt" : "input.txt")
      @data = File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n")
    end
  end
end
