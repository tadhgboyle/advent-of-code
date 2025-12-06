require "pry"
require "set"

module Year2025
  class Day05
    PART1_ANSWER = 868
    PART2_ANSWER = 354143734113772

    def part1(input)
      fresh_ranges = []

      input.chomp.split("\n").each do |line|
        break if line == ""

        ranged = line.split("-").map(&:to_i)
        fresh_ranges << (ranged[0]..ranged[1])
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
      ranges = []
      input.chomp.split("\n").each do |line|
        break if line == ""
        start_val, end_val = line.split("-").map(&:to_i)

        ranges << [start_val, end_val]
      end

      ranges.sort! { |a, b| a[0] <=> b[0] }

      merged_ranges = [ranges.first]

      ranges[1..].each do |current_range|
        last_merged_range = merged_ranges.last

        if current_range[0] <= last_merged_range[1] + 1
          last_merged_range[1] = [last_merged_range[1], current_range[1]].max
        else
          merged_ranges << current_range
        end
      end

      possible_fresh_ingredients = 0
      merged_ranges.each do |start_val, end_val|
        possible_fresh_ingredients += (end_val - start_val + 1)
      end

      possible_fresh_ingredients
    end
  end
end
