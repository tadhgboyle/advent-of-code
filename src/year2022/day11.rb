module Year2022
  class Day11
    PART1_ANSWER = 58056
    PART2_ANSWER = 15048718170

    def part1(input)
      conduct_inspections(input, rounds: 20, divide_by_three: true)
    end

    def part2(input)
      conduct_inspections(input, rounds: 10000, divide_by_three: false)
    end

    private

    def conduct_inspections(input, rounds:, divide_by_three:)
      monkeys = []
      input.each_line.each_slice(7) do |slice|
        monkeys << slice
                     .map(&:chomp)
                     .map(&:strip)
                     .filter { |s| s != "" }
                     .drop(1)
                     .map do |line|
          if line.start_with?("Starting items:")
            line.split(":")
                .drop(1)
                .first
                .split(",")
                .map(&:strip)
                .map(&:to_i)
          elsif line.start_with?("Operation:")
            line.split(" ").drop(4)
          elsif line.start_with?("Test:")
            line.split(" ").drop(3).first.to_i
          elsif line.start_with?("If")
            line.split(" ").drop(5).first.to_i
          else
            raise "invalid line #{line}"
          end
        end
      end

      inspection_counts = []

      rounds.times do
        monkeys.each_with_index do |monkey, index|
          monkey[0] = monkey[0].filter do |worry_item|
            worry_item = convert_item(monkey[1][0], monkey[1][1], worry_item)
            if divide_by_three
              worry_item = worry_item / 3
            else
              worry_item = worry_item % monkeys.map { |m| m[2] }.reduce(:lcm)
            end
            throw_to = monkey[execute_test(monkey[2], worry_item) ? 3 : 4]
            monkeys[throw_to][0].append(worry_item)

            if inspection_counts[index]
              inspection_counts[index] += 1
            else
              inspection_counts[index] = 1
            end

            false
          end
        end
      end

      inspection_counts.sort.reverse.take(2).reduce(:*)
    end

    def convert_item(operator, amount, worry_item)
      if amount == "old"
        amount = worry_item
      end

      amount = amount.to_i
      case operator
      when "+"
        return worry_item + amount
      when "-"
        return worry_item - amount
      when "/"
        return worry_item / amount
      when "*"
        return worry_item * amount
      else
        raise "invalid operator #{operator}, amount #{amount}"
      end
    end

    def execute_test(divisible_by, worry_item)
      worry_item % divisible_by == 0
    end
  end
end
