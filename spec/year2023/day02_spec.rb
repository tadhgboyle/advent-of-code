require 'spec_helper'
require 'spec_helper'
require 'puzzle_input'
require 'day'

RSpec.describe Year2023::Day02 do
  it "solves part1" do
    d = Year2023::Day02.new
    expect(d.part1(PuzzleInput.load("2023", "02"))).to eq(Year2023::Day02::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2023::Day02.new
    expect(d.part2(PuzzleInput.load("2023", "02"))).to eq(Year2023::Day02::PART2_ANSWER)
  end
end
