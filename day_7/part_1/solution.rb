# frozen_string_literal: true

# irb -r ./day_7/part_1/solution.rb
module Day7
  class Part1
    MY_BAG = "shiny gold"
    attr_accessor :rules
    attr_reader :file_name
    attr_writer :data

    def initialize(test: false)
      @file_name = (test === true ? "test_input.txt" : "input.txt")
      @rules = { "no other" => {} }
      build_rules
    end

    # Day7::Part1.new.perform
    def perform
      rules.keys.count do |rule|
        look_for_my_bag_in(rule)
      end
    end

    private

    def build_rules
      data.map do |rule|
        process_rule(rule)
      end
    end

    def data
      @data ||= File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n")
    end

    def get_bag_name(str)
      str.gsub("bags", "").gsub("bag", "").strip
    end

    def look_for_my_bag_in(bag_name)
      contents = rules[bag_name].keys
      return true if contents.include?(MY_BAG)

      contents.map do |contained_bag|
        look_for_my_bag_in(contained_bag)
      end.inject(:|)
    end

    def process_rule(rule)
      name, contains = rule.split(" bags contain ")
      rules[name.strip] = process_contents(contains)
    end

    def process_contents(contents)
      return { "no other" => 0 } if contents == "no other bags."

      contents.gsub(".", "").split(", ").map do |singular_contents|
        amnt, bag_str = singular_contents.split(" ", 2)
        [get_bag_name(bag_str), amnt.to_i]
      end.to_h
    end
  end
end
