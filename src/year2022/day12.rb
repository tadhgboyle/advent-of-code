module Year2022
  class Day12
    PART1_ANSWER = ""
    PART2_ANSWER = ""

    def part1(input)
      start_pos = []
      end_pos = []
      grid = input.each_line.map.with_index do |line, row|
        line.chomp.chars.map.with_index do |char, column|
          if char == "S"
            char = "a"
            start_pos = [row, column]
          elsif char == "E"
            char = "z"
            end_pos = [row, column]
          end
          char.ord
        end
      end

      visited = []

      valid_coords = -> (adj_r, adj_c, r, c) {
        return false if adj_r < 0 || adj_c < 0
        return false if adj_r >= grid.length || adj_c >= grid.first.length
        return false if visited.include?([adj_r, adj_c])
        return false if grid[adj_r][adj_c] - grid[r][c] > 1 && adj_c > c

        return true
      }

      queue = []
      queue.unshift(start_pos)
      visited.push(start_pos)

      move_row = [1, -1, 0, 0]
      move_column = [0, 0, 1, -1]

      visited_grid = input.each_line.map.with_index do |line|
        line.chomp.chars
      end

      found = false
      while queue.size != 0 && !found
        r, c = queue.shift

        4.times do |i|
          adjacent_r = r + move_row[i]
          adjacent_c = c + move_column[i]

          if [adjacent_r, adjacent_c] == end_pos
            found = true
            p "FOUND #{visited.size}"
            visited_grid[r][c] = if move_row[i] == -1
                                   "^"
                                 elsif move_row[i] == 1
                                   "v"
                                 elsif move_column[i] == 1
                                   ">"
                                 elsif move_column[i] == -1
                                   "<"
                                 end
            break
          end

          if valid_coords.call(adjacent_r, adjacent_c, r, c)
            queue.unshift([adjacent_r, adjacent_c])
            visited.push([r, c])
            visited_grid[r][c] = if move_row[i] == -1
                                   "^"
                                 elsif move_row[i] == 1
                                   "v"
                                 elsif move_column[i] == 1
                                   ">"
                                 elsif move_column[i] == -1
                                   "<"
                                 end
          end
        end
      end

      visited_grid.each { p _1 }
      p visited.size
      exit
      raise "could not find end pos"
    end

    def part2(input)
      nil
    end
  end
end
