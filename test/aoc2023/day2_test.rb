# typed: strict
# frozen_string_literal: true

require "test_helper"

module AoC2023
  class Day2Test < Minitest::Test
    describe AoC2023::Day2 do
      before do
        @input = <<~INPUT
          Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
          Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
          Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
          Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
          Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        INPUT
        @input = T.let(@input, String)
      end

      describe "#part1" do
        it "solves part 1" do
          solver = AoC2023::Day2.new(@input)

          assert_equal("8", solver.part1)
        end
      end

      describe "#part2" do
        it "solves part 2" do
          solver = AoC2023::Day2.new(@input)

          assert_equal("2286", solver.part2)
        end
      end
    end
  end
end
