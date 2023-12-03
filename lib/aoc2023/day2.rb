# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "solver"

module AoC2023
  class Day2 < Solver
    extend T::Sig

    COLORS = T.let([:red, :green, :blue].freeze, T::Array[Symbol])

    sig { override.params(input: String).void }
    def initialize(input)
      super

      @games = T.let(
        @input
        .strip
        .lines
        .map do |line|
          m = line.match(/^Game (?<game_number>\d+): (?<results>.*)$/)

          raise "Unexpected input: #{line}" if m.nil?

          sets = T.must(m["results"]).split("; ").map do |set|
            set.split(", ").map do |number_and_color|
              parts = number_and_color.split(" ", 2)
              [T.must(parts[1]).to_sym, T.must(parts[0]).to_i]
            end
              .to_h
          end

          [T.must(m["game_number"]).to_i, sets]
        end.to_h,
        T::Hash[Integer, T::Array[T::Hash[Symbol, Integer]]],
      )
    end

    sig { override.returns(String) }
    def part1
      @games
        .select do |_, game|
          game.all? do |set|
            set.fetch(:red, 0) <= 12 && set.fetch(:green, 0) <= 13 && set.fetch(:blue, 0) <= 14
          end
        end
        .keys
        .sum
        .to_s
    end

    sig { override.returns(String) }
    def part2
      @games
        .sum do |_, game|
          COLORS.map do |color|
            T.must(game.map { |set| set.fetch(color, 0) }.max)
          end
            .inject(&:*)
        end
        .to_s
    end
  end
end
