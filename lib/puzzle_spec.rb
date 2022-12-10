class PuzzleSpec
  class << self
    def spec_source_directory(year)
      File.join("spec", "year#{year}")
    end

    def spec_source_path(year, day)
      day = Day.pad(day)
      File.join(spec_source_directory(year), "day#{day}_spec.rb")
    end

    def spec_source(year, day)
      day = Day.pad(day)

      <<~TPL
      require 'spec_helper'
      require 'spec_helper'
      require 'puzzle_input'
      require 'day'

      RSpec.describe Year#{year}::Day#{day} do
        it "solves part1" do
          d = Year#{year}::Day#{day}.new
          expect(d.part1(PuzzleInput.load("#{2022}", "#{day}"))).to eq(Year#{year}::Day#{day}::PART1_ANSWER)
        end

        it "solves part2" do
          d = Year#{year}::Day#{day}.new
          expect(d.part2(PuzzleInput.load("#{2022}", "#{day}"))).to eq(Year#{year}::Day#{day}::PART2_ANSWER)
        end
      end
      TPL
    end
  end
end
