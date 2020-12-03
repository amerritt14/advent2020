# frozen_string_literal: true

# irb -r ./day_3/part_1/solution.rb
module Day3
  class Part1
    START_X = 0
    START_Y = 0
    DIST_X = 3  # How far in the x direction we move each "time". Positive implies moving right
    DIST_Y = -1 # How far in the y direction we move each "time". Positive implies moving up
    TREE = "#"  # The character that represents a tree on the map

    def initialize(test: false)
      @test = test
      @curr_x = START_X
      @curr_y = START_Y
      @collisions = 0
    end

    # Day3::Part1.new.perform
    def perform(dist_x = DIST_X, dist_y = DIST_Y)
      @dist_x = dist_x
      @dist_y = dist_y
      move while @curr_y < total_y

      @collisions
    end

    private

    def check_for_collision
      @collisions += 1 if data[@curr_y][@curr_x] == TREE
      # Usefull debug statement to see what's going on.
      # puts "#{@collisions} collisions at [#{@curr_y},#{@curr_x}] : #{data[@curr_y][@curr_x]}"
    end

    def data
      return @data unless @data.nil?

      file_name = (@test === true ? "test_input.txt" : "input.txt")
      @data = File.read(File.expand_path("../../#{file_name}", __FILE__)).split("\n")
    end

    def total_y
      @total_y ||= data.size - 1 # account for the 0 index
    end

    def total_x
      @total_x ||= data.first.size
    end

    def initialize_starting_data
      set_loc(START_X, START_Y)
      @collisions = 0
    end

    def move
      new_x = (@curr_x + @dist_x) % total_x # Modding by the total length of the row will effectively wrap the row
      new_y = @curr_y - @dist_y
      set_loc(new_x, new_y)
      check_for_collision
    end

    # Sets the absolute location of the x and y
    def set_loc(x, y)
      @curr_x = x
      @curr_y = y
    end
  end
end
