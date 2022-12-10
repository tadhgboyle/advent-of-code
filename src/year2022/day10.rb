module Year2022
  class Day10
    PART1_ANSWER = 13440
    PART2_ANSWER = nil

    def part1(input)
      [20, 60, 100, 140, 180, 220].map do |cycle|
        values(input)[cycle - 1] * cycle
      end.sum
    end

    def part2(input)
      crt_output = values(input).map.with_index do |value, index|
        position = index % 40
        ((value - 1..value + 1).include?(position) ? '#' : '.')
      end

      crt_output.pop
      crt_output.each_slice(40).each do |slice|
        puts slice.join
      end

      nil
    end

    private

    def values(input)
      values = [1]

      input.each_line do |line|
        line = line.chomp
        instruction, value = line.split(" ")

        values << values.last
        if instruction == "addx"
          values << values.last + value.to_i
        end
      end

      values
    end
  end
end
