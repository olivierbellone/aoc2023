# typed: strict
# frozen_string_literal: true

require "test_helper"

module AoC2023
  class Day3Test < Minitest::Test
    describe AoC2023::Day3 do
      before do
        @input = <<~INPUT
          467..114..
          ...*......
          ..35..633.
          ......#...
          617*......
          .....+.58.
          ..592.....
          ......755.
          ...$.*....
          .664.598..
        INPUT
        @input = T.let(@input, String)
      end
      describe "#part1" do
        it "solves part 1" do
          solver = AoC2023::Day3.new(@input)

          assert_equal("4361", solver.part1)
        end
      end

      describe "#part2" do
        it "solves part 2" do
          solver = AoC2023::Day3.new(@input)

          assert_equal("467835", solver.part2)
        end
      end
    end
  end
end
