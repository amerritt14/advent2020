# frozen_string_literal: true

require File.expand_path("../../part_1/solution.rb", __FILE__)

# irb -r ./day_8/part_2/solution.rb
module Day8
  class Part2
    attr_accessor :modifier_index, :success
    attr_reader :file_name
    attr_writer :data

    def initialize(test: false)
      @file_name = (test === true ? "test_input.txt" : "input.txt")
      @modifier_index = 0
      @success = false
    end

    # Day8::Part2.new.perform
    def perform
      until success do
        @success = Day8::Part1.new(data: modified_data).perform
        modify_next_instruction
      end
      success
    end

    private

    def data
      @data ||= File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n")
    end

    def modified_data
      modified_data = data.dup
      modified_data[modifier_index] = flip_instruction(data[modifier_index])
      modified_data
    end

    def modify_next_instruction
      @modifier_index += 1
      modify_next_instruction if nop?(data[modifier_index])
    end

    def nop?(instruction)
      command, _value = instruction.split(" ")
      command == "nop"
    end

    def flip_instruction(instruction)
      command, value = instruction.split(" ")
      [flip_command(command), value].join(" ")
    end

    def flip_command(command)
      case command
      when "jmp"
        "nop"
      when "nop"
        "jmp"
      else
        command
      end
    end
  end
end
