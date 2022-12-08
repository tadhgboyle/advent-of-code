require 'spec_helper'

RSpec.describe Year2022::Day04 do
  it "solves part1" do
    d = Year2022::Day04.new
    expect(d.part1(PuzzleInput.load("2022", "4"))).to eq(Year2022::Day04::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2022::Day04.new
    expect(d.part2(PuzzleInput.load("2022", "4"))).to eq(Year2022::Day04::PART2_ANSWER)
  end
end