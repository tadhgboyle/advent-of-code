module Year2023
  class Day01
    PART1_ANSWER = 53974
    PART2_ANSWER = 52840 # 281 test

    DIGITS = {
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9,
    }.freeze

    def part1(input)
      sum = 0
      input.each_line do |line|
        numbers = line.scan(/\d+/)
          .map(&:chars)
          .flatten
          .map(&:to_i)
        sum += "#{numbers.first}#{numbers.last}".to_i
      end
      sum
    end

    def part2(input)
      sum = 0
      scanning = "(?=(#{
        DIGITS.keys.join("|") + "|" + DIGITS.values.join("|")
      }))"
      input.each_line do |line|
        line_digits = line.scan(/#{scanning}/).flatten.map do |n|
          if n.length == 1
            n.to_i
          else
            DIGITS[n]
          end
        end
        sum += "#{line_digits.first}#{line_digits.last}".to_i
      end
      sum
    end
  end
end
