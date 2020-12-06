# frozen_string_literal: true

# irb -r ./day_6/part_1/solution.rb
module Day6
  class Part1
    attr_accessor :file_name
    attr_writer :data

    def initialize(test: false)
      @file_name = (test === true ? "test_input.txt" : "input.txt")
    end

    # Day6::Part1.new.perform
    def perform
      data.sum do |group|
        group.gsub("\n", "").split("").uniq.size
      end
    end

    private

    def data
      @data ||= File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n\n")
    end
  end
end
