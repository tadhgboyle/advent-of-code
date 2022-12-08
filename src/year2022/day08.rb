module Year2022
  class Day08
    PART1_ANSWER = 1736
    PART2_ANSWER = 268800

    def part1(input)
      visible_trees = 0

      field = input.each_line.map do |line|
        line.chomp.chars
      end

      # add outside edge trees
      visible_trees += (field.size * 2) + ((field.size - 2) * 2)

      field.each_with_index do |row, row_idx|
        # skip first and last rows, they are edges
        if row_idx == 0
          next
        elsif row_idx == field.size - 1
          next
        end

        # skip first and last from row, they are edges
        row = row.dup
        row.pop
        row.shift

        row.each_with_index do |tree, col_idx|
          col_idx = col_idx + 1

          above_trees, right_trees, below_trees, left_trees = trees_surrounding(field, row_idx, col_idx)

          # check with above
          if taller_than_all(tree, above_trees)
            visible_trees += 1
            next
          end

          # check with right
          if taller_than_all(tree, right_trees)
            visible_trees += 1
            next
          end

          # check with below
          if taller_than_all(tree, below_trees)
            visible_trees += 1
            next
          end

          # check with left
          if taller_than_all(tree, left_trees)
            visible_trees += 1
            next
          end
        end
      end

      visible_trees
    end

    def part2(input)
      scenic_scores = []

      field = input.each_line.map do |line|
        line.chomp.chars
      end

      field.each_with_index do |row, row_idx|
        # skip first and last rows, they are edges
        if row_idx == 0
          next
        elsif row_idx == field.size - 1
          next
        end

        # skip first and last from row, they are edges
        row = row.dup
        row.pop
        row.shift

        row.each_with_index do |tree, col_idx|
          tree = tree.to_i
          col_idx = col_idx + 1

          above_trees, right_trees, below_trees, left_trees = trees_surrounding(field, row_idx, col_idx)

          scenic_scores <<
              { above_trees => true, right_trees => false, below_trees => false, left_trees => true}.map do |trees, reverse|
                count_can_see(tree, trees, reverse)
              end.reduce(1, :*)
        end
      end

      scenic_scores.max
    end

    private

    def taller_than_all(tree, trees)
      trees.size > 0 && trees.all? { |t| t.to_i < tree.to_i }
    end

    def trees_surrounding(field, row_idx, col_idx)
      above = (0..row_idx - 1).map { |i|
        field[i][col_idx]
      }.map(&:to_i)
      right = (col_idx + 1..field.size - 1).map { |i|
        field[row_idx][i]
      }.map(&:to_i)
      below = (row_idx + 1..field.size - 1).map { |i|
        field[i][col_idx]
      }.map(&:to_i)
      left = (0..col_idx - 1).map { |i|
        field[row_idx][i]
      }.map(&:to_i)

      [above, right, below, left]
    end

    def count_can_see(tree, trees, reverse)
      if reverse
        trees = trees.reverse
      end

      if trees.all? { |t| tree > t }
        return trees.size
      end

      see = 1

      trees.each do |t|
        if t == tree
          break
        end

        if t > tree
          break
        else
          see += 1
        end
      end

      see
    end
  end
end
