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
      possible_fresh_ingredients = Set.new

      input.chomp.split("\n").each do |line|
        break if line == ""

        ranged = line.split("-").map(&:to_i)
        ranged[0].upto(ranged[1]).each do |i|
          possible_fresh_ingredients << i
        end
      end

      possible_fresh_ingredients.size

      # ranges = []

      # input.chomp.split("\n").each do |line|
      #   break if line == ""

      #   ranged = line.split("-").map(&:to_i)
      #   ranges << (ranged[0]..ranged[1]).to_a
      # end

      # ranges.flatten.uniq.size
    end
  end
end
