# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "solver"

module AoC2023
  class Day3 < Solver
    extend T::Sig

    sig { override.params(input: String).void }
    def initialize(input)
      super

      @x_max = T.let(T.must(@input.lines.first).size, Integer)
      @y_max = T.let(@input.lines.size, Integer)

      @numbers = T.let({}, T::Hash[T::Array[Position], Integer])
      @symbols = T.let({}, T::Hash[Position, String])

      number_buffer = +""

      input
        .strip
        .split("\n")
        .each_with_index do |line, y|
          line.chars.each_with_index do |char, x|
            case char
            when /\d/
              # Digit, part of a number
              number_buffer << char
              unless /\d/.match?(line[x + 1])
                number = number_buffer.to_i
                positions = (number_buffer.size - 1).downto(0).map do |i|
                  Position.new(x: x - i, y: y)
                end
                @numbers[positions] = number
                number_buffer = +""
              end
            when "."
              # Do nothing
            else
              # Symbol
              @symbols[Position.new(x: x, y: y)] = char
            end
          end
        end
    end

    sig { override.returns(String) }
    def part1
      @numbers.select do |positions, _|
        positions.any? do |p|
          p.neighbors(0, 0, @x_max, @y_max).any? do |n|
            @symbols.keys.include?(n) # rubocop:disable Performance/InefficientHashSearch
          end
        end
      end
        .values
        .sum
        .to_s
    end

    sig { override.returns(String) }
    def part2
      @symbols
        .select { |_, char| char == "*" }
        .filter_map do |symbol_position, _|
          numbers = @numbers.select do |positions, _|
            positions.any? { |p| p.neighbors(0, 0, @x_max, @y_max).any?(symbol_position) }
          end
          next unless numbers.size == 2

          numbers.values.inject(&:*)
        end
        .sum
        .to_s
    end
  end
end
