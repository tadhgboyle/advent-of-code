require "pry"

module Year2025
  class Day05
    PART1_ANSWER = 868
    PART2_ANSWER = ""

    def part1(input)
      fresh_ranges = []

      input.chomp.split("\n").each do |line|
        break if line == ""

        ranged = line.split("-")
        fresh_ranges << (ranged[0].to_i..ranged[1].to_i)
      end

      fresh_ingredients = 0

      input.chomp.split("\n").each do |line|
        next if line.include?("-")
        next if line == ""

        if fresh_ranges.any? { |r| r.include?(line.to_i) }
          fresh_ingredients += 1
        end
      end

      fresh_ingredients
    end

    def part2(input)
      nil
    end
  end
end
