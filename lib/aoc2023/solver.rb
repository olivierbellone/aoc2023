# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

module AoC2023
  class Solver
    extend T::Sig
    extend T::Helpers

    abstract!

    sig { overridable.params(input: String).void }
    def initialize(input)
      @input = input
    end

    sig { abstract.returns(String) }
    def part1; end

    sig { abstract.returns(String) }
    def part2; end
  end
end
