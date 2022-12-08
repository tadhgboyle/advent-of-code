require 'spec_helper'

RSpec.describe Year2022::Day08 do
  it "solves part1" do
    d = Year2022::Day08.new
    expect(d.part1(PuzzleInput.load("2022", "8"))).to eq(Year2022::Day08::PART1_ANSWER)
  end

  it "solves part2" do
    d = Year2022::Day08.new
    expect(d.part2(PuzzleInput.load("2022", "8"))).to eq(Year2022::Day08::PART2_ANSWER)
  end
end

def input
  File.open(File.join("input", "2022", "day-08")).read
end
