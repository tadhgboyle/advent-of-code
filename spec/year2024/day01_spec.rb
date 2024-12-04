require 'spec_helper'
require 'spec_helper'
require 'puzzle_input'
require 'day'

RSpec.describe Year2024::Day01 do
  it "solves part1" do
    d = Year2024::Day01.new
    expect(d.part1(PuzzleInput.load("2024", "01"))).to eq(Year2024::Day01::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2024::Day01.new
    expect(d.part2(PuzzleInput.load("2024", "01"))).to eq(Year2024::Day01::PART2_ANSWER)
  end
end
