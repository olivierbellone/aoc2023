# typed: strict
# frozen_string_literal: true

require "minitest/autorun"
require "minitest/reporters"

require "aoc2023"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new(color: true))
