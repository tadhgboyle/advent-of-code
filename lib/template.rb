require 'fileutils'

class Template
  class << self
    def create_source(year, day)
      source_directory = PuzzleSource.puzzle_source_directory(year)
      FileUtils.mkdir_p(source_directory) unless Dir.exist?(source_directory)
      puzzle_path = PuzzleSource.puzzle_source_path(year, day)
      PuzzleInput.skip_if_exists(puzzle_path) do
        File.open(puzzle_path, "w") do |f|
          f.write(PuzzleSource.puzzle_source(year, day))
        end
      end
    end

    def create_spec(year, day)
      spec_directory = PuzzleSpec.spec_source_directory(year)
      FileUtils.mkdir_p(spec_directory) unless Dir.exist?(spec_directory)
      spec_path = PuzzleSpec.spec_source_path(year, day)
      PuzzleInput.skip_if_exists(spec_path) do
        File.open(spec_path, "w") do |f|
          f.write PuzzleSpec.spec_source(year, day)
        end
      end
    end
  end
end
