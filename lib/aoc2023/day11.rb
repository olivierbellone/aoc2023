# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "solver"

module AoC2023
  class Day11 < Solver
    extend T::Sig

    # sig { override.params(input: String).void }
    # def initialize(input)
    #   super
    # end

    sig { override.returns(String) }
    def part1
      ""
    end

    sig { override.returns(String) }
    def part2
      ""
    end
  end
end
