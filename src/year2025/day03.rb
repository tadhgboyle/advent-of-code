module Year2025
  class Day03
    PART1_ANSWER = 17034
    PART2_ANSWER = ""

    def part1(input)
      battery_banks = input.split("\n").map { |bb| bb.split("").map(&:to_i) }

      joltages = []

      battery_banks.each do |bank|
        largest_battery = nil
        second_largest_battery = nil

        indexed_bank = bank.map.with_index do |b, i|
          { battery: b, index: i }
        end

        last_battery = indexed_bank.last
        indexed_bank = indexed_bank.reject { |ib| ib == last_battery }.sort_by { |ib| [-ib[:battery], ib[:index]] }
        largest_battery = indexed_bank[0]

        indexed_bank_after = indexed_bank.select { |ib| ib[:index] > largest_battery[:index] }
        second_largest_battery = indexed_bank_after[0]
        if second_largest_battery.nil?
          second_largest_battery = last_battery
        else
          second_largest_battery = last_battery[:battery] > second_largest_battery[:battery] ? last_battery : second_largest_battery
        end

        joltage = [largest_battery[:battery], second_largest_battery[:battery]].join.to_i
        joltages << joltage
      end

      joltages.sum
    end

    def part2(input)
      nil
    end
  end
end
