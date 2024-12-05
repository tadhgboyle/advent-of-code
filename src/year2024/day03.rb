module Year2024
  class Day03
    PART1_ANSWER = 173419328
    PART2_ANSWER = 90669332

    def part1(input)
      sum = 0

      regex = /mul\((\d+),(\d+)\)/
      input.scan(regex) do |match|
        sum += match.map(&:to_i).reduce(:*)
      end

      sum
    end

    def part2(input)
      sum = 0

      regex = /mul\((\d+),(\d+)\)|(don't\(\))|(do\(\))/
      
      multiply = true
      input.scan(regex) do |match|
        match.compact!

        if match[0] == "don't()"
          multiply = false
        elsif match[0] == "do()"
          multiply = true
        elsif match.size == 2 && multiply
          sum += match.map(&:to_i).reduce(:*)
        end
      end

      sum
    end
  end
end
