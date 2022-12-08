require 'benchmark'

# Manage a solution's source file for a given day
class PuzzleSource
  class << self
    def initialize_puzzle(year, day)
      Module.const_get("Year#{year}").const_get("Day#{Day.pad(day)}").new
    rescue NameError
      puts "There is no solution for this puzzle"
    end

    def run_part(part_name)
      has_result = false
      t = Benchmark.realtime do
        solution = yield
        if !solution.nil?
          puts "Result for #{part_name}:"
          puts solution
          has_result = true
        else
          puts "No result for #{part_name}"
        end
      end
      puts "(obtained in #{t} seconds)" if has_result
    end

    def puzzle_source_directory(year)
      File.join("src", "year#{year}")
    end

    def puzzle_source_path(year, day)
      day = Day.pad(day)
      File.join(puzzle_source_directory(year), "day#{day}.rb")
    end

    def puzzle_source(year, day)
      day = Day.pad(day)

      <<~TPL
      module Year#{year}
        class Day#{day}
          def part1(input)
            nil
          end

          def part2(input)
            nil
          end
        end
      end
      TPL
    end
  end
end
