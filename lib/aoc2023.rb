# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "aoc2023/solver"
require_relative "aoc2023/day1"
require_relative "aoc2023/day2"

module AoC2023
  extend T::Sig

  SOLVERS = T.let(
    {
      1 => AoC2023::Day1,
      2 => AoC2023::Day2,
    },
    T::Hash[Integer, T.class_of(Solver)],
  )

  sig { params(args: T::Array[String]).void }
  def self.main(args)
    day, path = parse_args(args)

    solver = SOLVERS.fetch(day).new(File.read(path))

    puts(solver.part1)
    puts(solver.part2)
  end

  sig { params(args: T::Array[String]).returns([Integer, String]) }
  def self.parse_args(args)
    if args.size != 2
      $stderr.puts("Syntax: aoc2023 <day#> <input file>")
      exit(1)
    end

    begin
      day = Integer(args.fetch(0))
    rescue ArgumentError
      $stderr.puts("Invalid day number: #{args.fetch(0)}")
      $stderr.puts("Day number must be an integer")
      exit(1)
    end

    unless SOLVERS.key?(day)
      $stderr.puts("Invalid day number: #{args.fetch(0)}")
      $stderr.puts("Valid day numbers: #{SOLVERS.keys.join(", ")}")
      exit(1)
    end

    path = args.fetch(1)
    unless File.file?(path)
      $stderr.puts("Invalid input file: #{path}")
      exit(1)
    end

    [day, path]
  end
end
