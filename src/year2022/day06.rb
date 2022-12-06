module Year2022
  class Day06
    def part1(input)
      detect_unique_string(input, length: 4)
    end

    def part2(input)
      detect_unique_string(input, length: 14)
    end

    private

    def detect_unique_string(input, length:)
      chars = input.chars
      last_four = []
      position = 0

      chars.each do |char|
        last_four << char
        position += 1

        if last_four.uniq.length == length
          break
        elsif last_four.length == length
          last_four = last_four.drop(1)
        end
      end

      position
    end
  end
end
