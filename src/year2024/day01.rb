module Year2024
  class Day01
    PART1_ANSWER = 1110981
    PART2_ANSWER = 24869388

    def part1(input)
      left_list = []
      right_list = []

      input.each_line do |line|
        left, right = line.split("   ")

        left_list << left
        right_list << right
      end

      left_list.sort!
      right_list.sort!

      total_distance = 0

      left_list.each_with_index do |left, index|
        right = right_list[index]
        total_distance += (left.to_i - right.to_i).abs
      end

      total_distance
    end

    def part2(input)
      left_list = []
      right_list = []

      input.each_line do |line|
        left, right = line.split("   ")

        left_list << left.to_i
        right_list << right.to_i
      end

      similarity_score = 0

      left_list.each do |left|
        similarity_score += left * right_list.count(left)
      end

      similarity_score
    end
  end
end
