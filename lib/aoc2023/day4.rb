# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "solver"

module AoC2023
  class Day4 < Solver
    extend T::Sig

    sig { override.params(input: String).void }
    def initialize(input)
      super

      @cards = T.let(
        @input
          .strip
          .lines
          .map do |line|
            m = line.match(/^Card\W+(?<index>\d+): (?<winning_numbers>.*) \| (?<numbers>.*)$/)

            raise "Unexpected input: #{line}" if m.nil?

            winning_numbers = T.must(m["winning_numbers"]).split(" ").map { |x| x.strip.to_i }.to_set
            numbers = T.must(m["numbers"]).split(" ").map { |x| x.strip.to_i }.to_set
            [winning_numbers, numbers]
          end,
        T::Array[[T::Set[Integer], T::Set[Integer]]],
      )

      @scores = T.let(
        @cards.map { |(winning_numbers, numbers)| winning_numbers.intersection(numbers).size },
        T::Array[Integer],
      )
    end

    sig { override.returns(String) }
    def part1
      @scores.sum { |score| score == 0 ? 0 : 2**(score - 1) }.to_s
    end

    sig { override.returns(String) }
    def part2
      copies = @scores.map { 1 }

      @scores.each_with_index do |score, index|
        (1..score).each do |i|
          copies[index + i] = copies.fetch(index + i) + copies.fetch(index)
        end
      end

      copies.sum.to_s
    end
  end
end
