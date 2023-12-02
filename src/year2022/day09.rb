module Year2022
  class Day09
    PART1_ANSWER = ""
    PART2_ANSWER = ""

    DIRS = { "U" => :y, "D" => :y, "L" => :x, "R" => :x }

    def part1(input)
      head_coords = { x: 0, y: 0 }
      tail_coords = { x: 0, y: 0 }

      render_grid(head_coords, tail_coords)

      tail_movements = []

      input.each_line do |movement|
        direction, amount = movement.chomp.split(" ")
        amount = amount.to_i

        case direction
        when "U"
          head_coords[:y] += amount
        when "D"
          head_coords[:y] -= amount
        when "L"
          head_coords[:x] -= amount
        when "R"
          head_coords[:x] += amount
        else
          raise "invalid direction #{direction}"
        end
        p "MOVING TAIL #{amount - 1} #{direction}"

        (amount - 1).times do
          if head_coords[:x] == tail_coords[:x]
            if head_coords[:y] - 1 == tail_coords[:y] || head_coords[:y] + 1 == tail_coords[:y]
              p "touching y"
              break
            end
          end

          if head_coords[:y] == tail_coords[:y]
            if head_coords[:x] - 1 == tail_coords[:x] || head_coords[:x] + 1 == tail_coords[:x]
              p "touching x"
              break
            end
          end

          if head_coords[:x] > tail_coords[:x]
            tail_coords[:x] += 1
          elsif head_coords[:x] < tail_coords[:x]
            tail_coords[:x] -= 1
          elsif head_coords[:y] > tail_coords[:y]
            tail_coords[:y] += 1
          elsif head_coords[:y] < tail_coords[:y]
            tail_coords[:y] -= 1
          end

          tail_movements << tail_coords.dup
        end

        render_grid(head_coords, tail_coords)
      end

      tail_movements.size
    end

    def part2(input)
      nil
    end

    private

    def diff(a, b)
      (a - b).abs
    end

    def render_grid(head_coords, tail_coords)
      grid = Array.new(5) { Array.new(6, ".") }
      grid[0][0] = "s"
      grid[tail_coords[:y]][tail_coords[:x]] = "T"
      grid[head_coords[:y]][head_coords[:x]] = "H"

      puts
      p grid.reverse
    end
  end
end
