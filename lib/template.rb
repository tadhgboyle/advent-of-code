require 'fileutils'

# Template management
class Template
  def self.create_templates(year, day)
    create_source(year, day)
  end

  def self.create_source(year, day)
    source_directory = PuzzleSource.puzzle_source_directory(year)
    FileUtils.mkdir_p(source_directory) unless Dir.exist?(source_directory)
    PuzzleInput.skip_if_exists(PuzzleSource.puzzle_source_path(year, day)) do
      File.open(PuzzleSource.puzzle_source_path(year, day), 'w') do |f|
        f.write PuzzleSource.puzzle_source(year, day)
      end
    end
  end
end
