class Part1
  def data(test = false)
    file_name = (test === true ? "test_input.txt" : "input.txt")
    data = File.foreach(file_name).map do |row|
      k, _, v = row.partition(": ")
      [k, v]
    end
  end

  def perform(test = false)
    data(test).count do |policy, password|
      valid?(policy, password)
    end
  end

  def valid?(policy, password)
    min, max, letter = parse_requirements(policy)
    password.count(letter).between?(min, max)
  end

  # policy is in the format "#{min}-#{max} #{letter}"
  # EX: "1-2 a"
  def parse_requirements(policy)
    range_str, letter = policy.split(" ")
    min, max = range_str.split("-").map(&:to_i)

    [min, max, letter]
  end
end
