require "pry"

module Year2025
  class Day04
    PART1_ANSWER = 1493
    PART2_ANSWER = ""

    def part1(input)
      grid = input.each_line.map(&:chomp)

      height = grid.size
      width = grid[0].size
      accessible_paper = 0

      adjacent_positions = [
        [-1, -1], [-1, 0], [-1, 1],
        [ 0, -1],          [ 0, 1],
        [ 1, -1], [ 1, 0], [ 1, 1]
      ]

      (0...height).each do |y|
        (0...width).each do |x|
          next unless grid[y][x] == "@"

          rolls_adjacent = 0

          adjacent_positions.each do |ay, ax|
            ay = y + ay
            ax = x + ax

            next unless ay.between?(0, height - 1) && ax.between?(0, width - 1)

            if grid[ay][ax] == "@"
              rolls_adjacent += 1
            end
          end

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
