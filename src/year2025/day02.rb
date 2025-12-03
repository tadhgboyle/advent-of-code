module Year2025
  class Day02
    PART1_ANSWER = ""
    PART2_ANSWER = ""

    def part1(input)
      ranges = input.split(",").map do |range|
        start_n, end_n = range.split("-").map(&:to_i)
        (start_n..end_n)
      end

      invalid_ids = []

      ranges.each do |range|
        range.each do |id|
          id = id.to_s
          length = id.length
          middle = length / 2

          first_half = id[0, middle]
          second_half = id[middle, length - middle]

          invalid_ids << id.to_i if first_half == second_half
        end
      end

      invalid_ids.sum
    end

    def part2(input)
      nil
    end
  end
end
