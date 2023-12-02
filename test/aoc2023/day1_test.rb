# typed: strict
# frozen_string_literal: true

require "test_helper"

module AoC2023
  class Day1Test < Minitest::Test
    describe AoC2023::Day1 do
      describe "#part1" do
        it "solves part 1" do
          input = <<~INPUT
            1abc2
            pqr3stu8vwx
            a1b2c3d4e5f
            treb7uchet
          INPUT
          solver = AoC2023::Day1.new(input)

          assert_equal("142", solver.part1)
        end
      end

      describe "#part2" do
        it "solves part 2" do
          input = <<~INPUT
            two1nine
            eightwothree
            abcone2threexyz
            xtwone3four
            4nineeightseven2
            zoneight234
            7pqrstsixteen
          INPUT
          solver = AoC2023::Day1.new(input)

          assert_equal("281", solver.part2)
        end
      end
    end
  end
end
