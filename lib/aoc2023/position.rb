# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

module AoC2023
  class Position < T::Struct
    extend T::Sig

    const :x, Integer
    const :y, Integer

    sig { params(other: T.untyped).returns(T::Boolean) }
    def ==(other)
      return false unless other.is_a?(Position)

      other.x == x && other.y == y
    end

    sig do
      params(x_min: Integer, y_min: Integer, x_max: Integer, y_max: Integer).returns(T::Array[Position])
    end
    def neighbors(x_min = -(2 << 31), y_min = -(2 << 31), x_max = 2 << 31, y_max = 2 << 31) # rubocop:disable Metrics/ParameterLists
      [-1, 0, 1].map do |y_offset|
        [-1, 0, 1].map do |x_offset|
          next if x_offset == 0 && y_offset == 0
          next if x + x_offset < x_min || x + x_offset > x_max
          next if y + y_offset < y_min || y + y_offset > y_max

          Position.new(x: x + x_offset, y: y + y_offset)
        end
      end.flatten.compact
    end

    sig do
      params(
        x_min: Integer,
        y_min: Integer,
        x_max: Integer,
        y_max: Integer,
        blk: T.proc.params(pos: Position).void,
      ).void
    end
    def each_neighbor(x_min = -(2 << 31), y_min = -(2 << 31), x_max = 2 << 31, y_max = 2 << 31, &blk) # rubocop:disable Metrics/ParameterLists
      neighbors(x_min, y_min, x_max, y_max).each(&blk)
    end
  end
end
