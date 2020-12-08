# frozen_string_literal: true

class InfiniteLoopDetected < StandardError
end

# irb -r ./day_8/part_1/solution.rb
module Day8
  class Part1
    attr_accessor :accumulator, :instructions
    attr_reader :file_name
    attr_writer :data

    def initialize(test: false, data:)
      @file_name = (test === true ? "test_input.txt" : "input.txt")
      @accumulator = 0
      @instructions = [0]
      @data = data
    end

    # Day8::Part1.new.perform
    def perform
      perform_loop
      accumulator
    rescue InfiniteLoopDetected
      puts "Accumulator before infinate loop: #{accumulator}"
      false
    end

    private

    def data
      @data ||= File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n")
    end

    def curr_instruction
      instructions.last
    end

    def acc(num)
      @accumulator += num
      next_instruction
    end

    def jmp(num)
      instructions << curr_instruction + num
    end

    def nop(_num)
      next_instruction
    end

    def next_instruction
      jmp(1)
    end

    def perform_loop
      run_current_instruction while curr_instruction < data.size
    end

    def run_current_instruction
      raise InfiniteLoopDetected if instructions.size != instructions.uniq.size

      run(data[curr_instruction])
    end

    def run(instruction)
      command, value = instruction.split(" ")
      send(command, value.to_i)
    end
  end
end
