# frozen_string_literal: true

# irb -r ./day_4/part_1/solution.rb
module Day4
  class Part1
    attr_accessor :test
    attr_writer :data

    VALID_FIELDS = %w(byr iyr eyr hgt hcl ecl pid cid).freeze
    OPTIONAL_FIELDS = %w(cid).freeze
    REQUIRED_FIELDS = VALID_FIELDS - OPTIONAL_FIELDS

    def initialize(test: false)
      @test = test
    end

    # Day4::Part1.new.perform
    def perform
      data.count do |passport|
        valid?(passport)
      end
    end

    private

    def data
      return @data unless @data.nil?

      file_name = (test === true ? "test_input.txt" : "input.txt")
      @data = File.
              read(File.expand_path("../../#{file_name}", __FILE__)).
              split("\n\n").                   # A blank line is the seperator between passport entries
              map do |row|
                row.
                  gsub("\n", " ").            # Bring the rest of the attributes on the same line
                  split(" ").                  # Separate each key/value pair
                  map{ |ele| ele.split(":") }. # Split the key/value pairs
                  to_h                         # Set each row to a hash of key/values
              end
    end

    def valid?(passport)
      all_required_fields_present?(passport)
    end

    def all_required_fields_present?(passport)
      (REQUIRED_FIELDS - passport.keys).empty?
    end
  end
end
