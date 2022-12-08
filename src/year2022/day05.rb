module Year2022
  class Day05
    PART1_ANSWER = "FZCMJCRHZ"
    PART2_ANSWER = "JSDHQMZGF"

    def part1(input)
      rows = []
      commands = []
      input.each_line do |line|
        if line == ""
          next
        end
        if line.start_with?("move")
          commands << line.split(" ").map { |e| e.to_i }.select { |i| i > 0 }
        else
          row = line.chomp.split("").map do |e|
            if e == "[" || e == "]"
              " "
            else
              e
            end
          end
          rows << row.drop(1) if row != []
        end
      end

      stacks = {}
      rows.last.select { |e| e != " " }.each do |index|
        stacks[index.to_i] = []
      end
      rows.pop

      rows = rows.transpose.reject { |row| row.all? { |e| e == " " } }
      rows.each_with_index do |row, index|
        stacks[index + 1] = row.select { |e| e != " " }
      end

      commands.each do |amount, from, to|
        elems = stacks[from].shift(amount)
        stacks[to].unshift(*elems.reverse)
      end

      stacks.map { |s| s[1].first }.join
    end

    def part2(input)
      rows = []
      commands = []
      input.each_line do |line|
        if line == ""
          next
        end
        if line.start_with?("move")
          commands << line.split(" ").map { |e| e.to_i }.select { |i| i > 0 }
        else
          row = line.chomp.split("").map do |e|
            if e == "[" || e == "]"
              " "
            else
              e
            end
          end
          rows << row.drop(1) if row != []
        end
      end

      stacks = {}
      rows.last.select { |e| e != " " }.each do |index|
        stacks[index.to_i] = []
      end
      rows.pop

      rows = rows.transpose.reject { |row| row.all? { |e| e == " " } }
      rows.each_with_index do |row, index|
        stacks[index + 1] = row.select { |e| e != " " }
      end

      commands.each do |amount, from, to|
        elems = stacks[from].shift(amount)
        stacks[to].unshift(*elems)
      end

      stacks.map { |s| s[1].first }.join
    end
  end
end
