require "pry"

module Year2025
  class Day04
    PART1_ANSWER = 1493
    PART2_ANSWER = ""

    def part1(input)
      diagram = input.each_line.map do |line|
        line.chomp.chars
      end

      paper_positions = []

      diagram.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          next unless cell == "@"

          paper_positions << [x, y]
        end
      end

      accessible_paper = 0

      diagram.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          next unless cell == "@"

          adjacent_positions = [
            [x - 1, y + 1],
            [x, y + 1],
            [x + 1, y + 1],
            [x - 1, y],
            [x + 1, y],
            [x - 1, y - 1],
            [x, y - 1],
            [x + 1, y - 1],
          ]

          rolls_adjacent = paper_positions.intersection(adjacent_positions).size

          accessible_paper += 1 if rolls_adjacent < 4
        end
      end

      accessible_paper
    end

    def part2(input)
      nil
    end
  end
end
