module Year2023
  class Day02
    PART1_ANSWER = 2771 # 8 test
    PART2_ANSWER = 70924 # 2286 test

    MAX_CUBES = {
      "red" => 12,
      "green" => 13,
      "blue" => 14,
    }.freeze

    def part1(input)
      possible_game_ids = []
      input.each_line do |line|
        line.chomp!
        id = line.split(" ")[1].chop.to_i
        sets = line.split(": ").drop(1).join.split("; ")
        possible = true
        sets.each do |set|
          cubes_by_colour = {}
          cubes = set.split(", ")
          cubes.each do |cube|
            cube = cube.split(" ")
            count = cube.first.to_i
            colour = cube.last
            cubes_by_colour[colour] ||= 0
            cubes_by_colour[colour] += count
          end
          possible = false if cubes_by_colour.any? do |colour, count|
            count > MAX_CUBES[colour]
          end
        end
        possible_game_ids << id if possible
      end

      possible_game_ids.sum
    end

    def part2(input)
      game_powers = []
      input.each_line do |line|
        cube_maxes = {}

        line.chomp!
        sets = line.split(": ").drop(1).join.split("; ")
        sets.each do |set|
          cubes = set.split(", ")
          cubes.each do |cube|
            cube = cube.split(" ")
            count = cube.first.to_i
            colour = cube.last
            cube_maxes[colour] ||= 0
            if cube_maxes[colour] < count
              cube_maxes[colour] = count
            end
          end
        end
        game_powers << cube_maxes.values.inject(:*)
      end
      game_powers.sum
    end
  end
end
