module Year2023
  class Day04
    PART1_ANSWER = 23678 # 13 test
    PART2_ANSWER = "" # 30 test

    def part1(input)
      game_points = 0

      input.each_line do |card|
        card.chomp!

        winning_numbers, my_numbers = card
          .split(": ")
          .drop(1)
          .first
          .split(" | ")
          .map { |nums| nums.split(" ") }
          .map { |nums| nums.map(&:to_i)}
        
        matches = 0
        winning_numbers.each do |num|
          matches += 1 if my_numbers.include?(num)
        end

        card_points = 0
        if matches > 0
          card_points = 1
        end

        _, matches = parse_card(card)

        to_double = matches - 1
        to_double.times do
          card_points = card_points * 2
        end

        game_points += card_points
      end

      game_points
    end

    def part2(input)
      nil
    end

    private

    def parse_card(row)
      card_number = row
        .split(": ")
        .first
        .split(" ")
        .drop(1)
        .first
        .to_i
      winning_numbers, my_numbers = row
        .split(": ")
        .drop(1)
        .first
        .split(" | ")
        .map { |nums| nums.split(" ") }
        .map { |nums| nums.map(&:to_i)}
      
      matches = 0
      winning_numbers.each do |num|
        matches += 1 if my_numbers.include?(num)
      end

      [card_number, matches]
    end
  end
end
