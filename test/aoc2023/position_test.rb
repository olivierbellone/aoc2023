# typed: strict
# frozen_string_literal: true

require "test_helper"

module AoC2023
  class PositionTest < Minitest::Test
    describe AoC2023::Position do
      before do
        @p = T.let(Position.new(x: 2, y: 3), Position)
      end

      describe "#==" do
        it "returns true for 2 different Position instances with the same coordinates" do
          assert_equal(@p, Position.new(x: 2, y: 3))
        end

        it "returns false 2 different Position instances with different coordinates" do
          refute_equal(@p, Position.new(x: 2, y: -1))
        end

        it "returns false when other is not a Position" do
          refute_equal(@p, "not a Position")
        end
      end

      describe "#neighbors" do
        it "returns all neighbors" do
          expected_neighbors = [
            Position.new(x: 1, y: 2),
            Position.new(x: 2, y: 2),
            Position.new(x: 3, y: 2),
            Position.new(x: 1, y: 3),
            Position.new(x: 3, y: 3),
            Position.new(x: 1, y: 4),
            Position.new(x: 2, y: 4),
            Position.new(x: 3, y: 4),
          ]

          assert_equal(expected_neighbors, @p.neighbors)
        end

        it "excludes out of bounds neighbors" do
          expected_neighbors = [
            Position.new(x: 1, y: 2),
            Position.new(x: 2, y: 2),
            Position.new(x: 1, y: 3),
          ]

          assert_equal(expected_neighbors, @p.neighbors(0, 0, 2, 3))
        end
      end

      describe "#each_neighbor" do
        it "yields neighbors" do
          expected_neighbors = [
            Position.new(x: 1, y: 2),
            Position.new(x: 2, y: 2),
            Position.new(x: 3, y: 2),
            Position.new(x: 1, y: 3),
            Position.new(x: 3, y: 3),
            Position.new(x: 1, y: 4),
            Position.new(x: 2, y: 4),
            Position.new(x: 3, y: 4),
          ]

          neighbors = []
          @p.each_neighbor { |n| neighbors << n }

          assert_equal(expected_neighbors, neighbors)
        end
      end
    end
  end
end
