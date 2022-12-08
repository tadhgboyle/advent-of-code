module Year2022
  class Day04
    PART1_ANSWER = 448
    PART2_ANSWER = 794

    def part1(input)
      overlapping = 0
      input.each_line do |assignment_pair|
        elf1_range, elf2_range = parse_assignment(assignment_pair)

        if elf1_range.cover?(elf2_range) || elf2_range.cover?(elf1_range)
          overlapping += 1
        end
      end

      overlapping
    end

    def part2(input)
      overlapping = 0
      input.each_line do |assignment_pair|
        elf1_range, elf2_range = parse_assignment(assignment_pair)

        if elf1_range.overlaps?(elf2_range) || elf2_range.overlaps?(elf1_range)
          overlapping += 1
        end
      end

      overlapping
    end

    private

    def parse_assignment(assignment_pair)
      elf1, elf2 = assignment_pair.chomp.split(",")
      elf1_start, elf1_end = elf1.split("-")
      elf1_range = (elf1_start.to_i..elf1_end.to_i)
      elf2_start, elf2_end = elf2.split("-")
      elf2_range = (elf2_start.to_i..elf2_end.to_i)

      [elf1_range, elf2_range]
    end
  end
end

class Range
  def overlaps?(other)
    !(self.end < other.begin || self.begin > other.end)
  end
end