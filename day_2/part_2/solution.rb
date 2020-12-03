require File.expand_path("../../part_1/solution.rb", __FILE__)

module Day2
  class Part2 < Part1
    def valid?(policy, password)
      first, second, letter = parse_requirements(policy)
      # According to the instructions, the positional arguments from the policy do not use a 0 index.
      (password[first - 1] == letter) ^ (password[second - 1] == letter)
    end
  end
end
