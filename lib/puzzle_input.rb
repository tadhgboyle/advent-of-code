# Puzzle input file management
class PuzzleInput
  class << self
    def load(year, day)
      input_path = puzzle_input_path(year, day)
      download_input(year, day) unless File.exist?(input_path)
      File.read(input_path)
    end

    def puzzle_input_path(year, day)
      day = Day.pad(day)
      File.join(ENV["AOC_INPUT_DIRECTORY"], year, "day-#{day}")
    end

    def download_input(year, day)
      aoc_api = AocApi.new(year, ENV["AOC_COOKIE"])
      input = aoc_api.get_day_input(day)
      save_puzzle(year, day, input)
    end

    def skip_if_exists(file)
      if File.exist?(file)
        puts "#{file} already exists, skipping"
      else
        yield
      end
    end

    private

    def save_puzzle(year, day, input)
      create_required_directories(year)
      puzzle_path = puzzle_input_path(year, day)
      skip_if_exists(puzzle_path) do
        File.open(puzzle_path, "w") { |f| f.write(input) }
      end
    end

    def create_required_directories(year)
      year_directory = File.join(ENV["AOC_INPUT_DIRECTORY"], year)
      FileUtils.mkdir_p(year_directory) unless Dir.exist?(year_directory)
    end
  end
end
