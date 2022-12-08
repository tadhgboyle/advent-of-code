module Year2022
  class Day03
    PART1_ANSWER = 7848
    PART2_ANSWER = 2616

    def part1(input)
      common_items = []
      input.each_line do |rucksack|
        rucksack_items = rucksack.chars
        first_compartment, second_compartment = rucksack_items.each_slice(rucksack.length / 2).map(&:join)

        common_items << find_common_letter([first_compartment, second_compartment])
      end

      common_items.map do |item|
        alphabet_num(item)
      end.sum
    end

    def part2(input)
      common_items = []
      input.lines.map(&:chomp).each_slice(3) do |current_grouping|
        common_items << find_common_letter(current_grouping)
      end

      common_items.map do |item|
        alphabet_num(item)
      end.sum
    end

    private

    def find_common_letter(lines)
      common_letter = nil
      chars = lines.map(&:chars).flatten.uniq

      chars.each do |char|
        if lines.all? { |line| line.chars.include?(char) }
          common_letter = char
          break
        end
      end

      common_letter
    end

    def alphabet_num(item)
      num = item.upcase.ord - 'A'.ord + 1
      if item.upcase == item
        num += 26
      end

      num
    end
  end
end
