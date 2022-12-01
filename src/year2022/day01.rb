module Year2022
  class Day01
    def part1(input)
      highest_calories = 0
      current_amount = 0
      input.each_line do |line|
        line = line.chomp

        if line == ""
          if current_amount >= highest_calories
            highest_calories = current_amount
          end
          current_amount = 0
        else
          current_amount += line.to_i
        end
      end

      highest_calories
    end

    def part2(input)
      all_calories = []
      current_amount = 0
      input.each_line do |line|
        line = line.chomp

        if line == ""
          all_calories << current_amount
          current_amount = 0
        else
          current_amount += line.to_i
        end
      end

      all_calories.sort.reverse.take(3).sum
    end
  end
end
