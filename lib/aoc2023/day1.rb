# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "solver"

module AoC2023
  class Day1 < Solver
    extend T::Sig

    DIGITS_MAP = T.let(
      {
        "one" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9,
        "1" => 1,
        "2" => 2,
        "3" => 3,
        "4" => 4,
        "5" => 5,
        "6" => 6,
        "7" => 7,
        "8" => 8,
        "9" => 9,
      }.freeze,
      T::Hash[String, String],
    )

    REGEX = T.let(/(#{DIGITS_MAP.keys.join("|")})/, Regexp)

    sig { override.returns(String) }
    def part1
      @input
        .strip
        .lines
        .sum do |line|
          digits = line.scan(/\d/).flatten
          (T.must(digits.first) + T.must(digits.last)).to_i
        end
        .to_s
    end

    sig { override.returns(String) }
    def part2
      @input
        .strip
        .lines
        .sum do |line|
          first = T.must(line
            .sub(REGEX) { |m| DIGITS_MAP.fetch(m) }
            .gsub(/\d/)
            .first)

          last = T.must(T.must(line[(line.rindex(REGEX))..-1])
            .sub(REGEX) { |m| DIGITS_MAP.fetch(m) }
            .gsub(/\d/)
            .first)

          (first + last).to_i
        end
        .to_s
    end
  end
end
