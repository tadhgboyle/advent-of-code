module Year2022
  class Day08
    PART1_ANSWER = 1736
    PART2_ANSWER = 268800

    def part1(input)
      visible_trees = 0

      field = input.each_line.map do |line|
        line.chomp.chars.map(&:to_i)
      end

      # add outside edge trees
      visible_trees += (field.size * 2) + ((field.size - 2) * 2)

      field.each_with_index do |row, row_idx|
        # skip first and last rows, they are edges
        if row_idx == 0
          next
        elsif row_idx == row.size - 1
          next
        end

        # skip first and last from row, they are edges
        row = row.dup
        row.pop
        row.shift

        row.each_with_index do |tree, col_idx|
          col_idx = col_idx + 1

          trees_surrounding(field, row_idx, col_idx).each do |trees|
            if trees.max < tree
              visible_trees += 1
              break
            end
          end
        end
      end

      visible_trees
    end

    def part2(input)
      scenic_scores = []

      field = input.each_line.map do |line|
        line.chomp.chars.map(&:to_i)
      end

      field.each_with_index do |row, row_idx|
        row.each_with_index do |tree, col_idx|
          scenic_scores.append(
            trees_surrounding(field, row_idx, col_idx).map do |trees|
              count_can_see(tree, trees)
            end.reduce(:*)
          )
        end
      end

      scenic_scores.max
    end

    private

    def trees_surrounding(field, row_idx, col_idx)
      above = (0..row_idx - 1).map { |i|
        field[i][col_idx]
      }.reverse
      right = (col_idx + 1..field.size - 1).map { |i|
        field[row_idx][i]
      }
      below = (row_idx + 1..field.size - 1).map { |i|
        field[i][col_idx]
      }
      left = (0..col_idx - 1).map { |i|
        field[row_idx][i]
      }.reverse

      [above, right, below, left]
    end

    def count_can_see(tree, trees)
      # why do i need this
      if trees.all? { |t| tree > t }
        return trees.size
      end

      see = 1

      trees.each do |t|
        break unless tree > t

        see += 1
      end

      see
    end
  end
end
