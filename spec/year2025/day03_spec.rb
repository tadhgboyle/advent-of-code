require 'spec_helper'
require 'spec_helper'
require 'puzzle_input'
require 'day'

RSpec.describe Year2025::Day03 do
  it "solves part1" do
    d = Year2025::Day03.new
    expect(d.part1(PuzzleInput.load("2025", "03"))).to eq(Year2025::Day03::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2025::Day03.new
    expect(d.part2(PuzzleInput.load("2025", "03"))).to eq(Year2025::Day03::PART2_ANSWER)
  end
end
