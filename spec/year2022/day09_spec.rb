require 'spec_helper'
require 'spec_helper'
require 'puzzle_input'
require 'day'

RSpec.describe Year2022::Day09 do
  it "solves part1" do
    d = Year2022::Day09.new
    expect(d.part1(PuzzleInput.load("2022", "09"))).to eq(Year2022::Day09::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2022::Day09.new
    expect(d.part2(PuzzleInput.load("2022", "09"))).to eq(Year2022::Day09::PART2_ANSWER)
  end
end
