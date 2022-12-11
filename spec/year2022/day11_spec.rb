require 'spec_helper'
require 'spec_helper'
require 'puzzle_input'
require 'day'

RSpec.describe Year2022::Day11 do
  it "solves part1" do
    d = Year2022::Day11.new
    expect(d.part1(PuzzleInput.load("2022", "11"))).to eq(Year2022::Day11::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2022::Day11.new
    expect(d.part2(PuzzleInput.load("2022", "11"))).to eq(Year2022::Day11::PART2_ANSWER)
  end
end
