module Year2025
  class Day01
    PART1_ANSWER = 1120
    PART2_ANSWER = ""

    DIAL_STARTING = 50
    OPERATIONS = {
      "R" => :+,
      "L" => :-,
    }

    def part1(input)
      dial = DIAL_STARTING
      times_hit_zero = 0

      input.split("\n").each do |r|
        direction = r[0]
        operation = OPERATIONS.fetch(direction)
        count = r[1..-1].to_i

        dial = dial.send(operation, count)
        while dial > 99
          dial = dial - 100
        end

        while dial < 0
          dial = 100 + dial
        end

        times_hit_zero += 1 if dial.zero?
      end

      times_hit_zero
    end

    def part2(input)
      dial = DIAL_STARTING
      times_passed_zero = 0

      input.split("\n").each do |r|
        direction = r[0]
        operation = OPERATIONS.fetch(direction)
        count = r[1..-1].to_i

        (0..count).each do
          dial = dial.send(operation, 1)
          if dial % 100 == 0
            times_passed_zero += 1
          end
        end
      end

      times_passed_zero
    end
  end
end
