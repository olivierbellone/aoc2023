# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require "zeitwerk"

module AoC2023
  module Autoloader
    extend T::Sig

    sig { void }
    def self.setup
      loader = Zeitwerk::Loader.new
      loader.inflector.inflect("aoc2023" => "AoC2023")
      loader.push_dir(File.dirname(T.must(__dir__))) # lib
      loader.setup
    end
  end
end
