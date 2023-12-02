# typed: strict
# frozen_string_literal: true

require_relative "aoc2023/autoloader"
AoC2023::Autoloader.setup

require "sorbet-runtime"

module AoC2023
  extend T::Sig

  SOLVERS = T.let(
    {
      1 => AoC2023::Day1,
      2 => AoC2023::Day2,
      3 => AoC2023::Day3,
      4 => AoC2023::Day4,
      5 => AoC2023::Day5,
      6 => AoC2023::Day6,
      7 => AoC2023::Day7,
      8 => AoC2023::Day8,
      9 => AoC2023::Day9,
      10 => AoC2023::Day10,
      11 => AoC2023::Day11,
      12 => AoC2023::Day12,
      13 => AoC2023::Day13,
      14 => AoC2023::Day14,
      15 => AoC2023::Day15,
      16 => AoC2023::Day16,
      17 => AoC2023::Day17,
      18 => AoC2023::Day18,
      19 => AoC2023::Day19,
      20 => AoC2023::Day20,
      21 => AoC2023::Day21,
      22 => AoC2023::Day22,
      23 => AoC2023::Day23,
      24 => AoC2023::Day24,
      25 => AoC2023::Day25,
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
  private_class_method def self.parse_args(args)
    if args.size != 2
      $stderr.puts("Syntax: #{$PROGRAM_NAME} <day number> <input file>")
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
