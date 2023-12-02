# typed: strict
# frozen_string_literal: true

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    SimpleCov.add_filter("/test/")
    SimpleCov.enable_coverage(:branch)
  end
end

require "minitest/autorun"
require "minitest/reporters"

require "aoc2023"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new(color: true))
