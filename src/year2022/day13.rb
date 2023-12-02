module Year2022
  class Day13
    PART1_ANSWER = ""
    PART2_ANSWER = ""

    def part1(input)
      correct = 0
      current_index = 1
      input.lines.map(&:chomp).filter { |l| l != "" }.each_slice(2) do |line|
        left_packet, right_packet = line

        left_packet = JSON.parse(left_packet)
        right_packet = JSON.parse(right_packet)

        if is_left_smaller(left_packet, right_packet)
          p "----- LEFT #{left_packet} is SMALLER than right #{right_packet}, INDEX #{current_index}"
          correct += current_index
        else
          p "LEFT #{left_packet} is BIGGER than right #{right_packet}, INDEX #{current_index}"
        end
        current_index += 1
      end

      correct
    end

    def part2(input)
      nil
    end

    private

    def is_left_smaller(left_packet, right_packet)
      left_packet.each_with_index do |left_value, left_index|
        return true if left_value_smaller(left_value, right_packet.size >= left_index && right_packet[left_index])
        right_value = right_packet.size >= left_index && right_packet[left_index]
        if right_value
          p "COMPARING #{left_value} to right #{right_value}"
          if left_value.is_a?(Numeric) && right_value.is_a?(Numeric)
            if right_value < left_value
              return false
            end
          elsif left_value.is_a?(Numeric) && right_value.is_a?(Array)
            p "LEFT IS INT #{left_value}, right is array #{right_value}"
            return is_left_smaller([left_value], right_value)
          elsif left_value.is_a?(Array) && right_value.is_a?(Numeric)
            p "LEFT IS ARRAY #{left_value}, right is int #{right_value}"
            return is_left_smaller(left_value, [right_value])
          elsif left_value.is_a?(Array) && right_value.is_a?(Array)
            p "LEFT IS ARRAY #{left_value}, right is array #{right_value}"
            return right_value.size > left_value.size
          end
        end
      end

      true
    end

    def left_value_smaller(left_value, right_value)

    end
  end
end
