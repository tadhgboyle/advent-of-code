module Year2025
  class Day02
    PART1_ANSWER = 26255179562
    PART2_ANSWER = 31680313976

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
      ranges = input.split(",").map do |range|
        start_n, end_n = range.split("-").map(&:to_i)
        (start_n..end_n)
      end

      invalid_ids = []

      ranges.each do |range|
        range.each do |id|
          id = id.to_s
          chunk_sizes_to_check = (1..id.length - 1)
          chunk_sizes_to_check.each do |chunk_size|
            if id.split("").each_slice(chunk_size).uniq.size == 1
              invalid_ids << id.to_i
              break
            end
          end
        end
      end

      invalid_ids.sum
    end
  end
end
