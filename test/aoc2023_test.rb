# typed: strict
# frozen_string_literal: true

require "test_helper"

module AoC2023
  class AoC2023Test < Minitest::Test
    describe AoC2023 do
      describe ".main" do
        it "loads and runs the requested solver" do
          Tempfile.create("input.txt") do |file|
            assert_output("0\n0\n", "") do
              AoC2023.main(["1", file.path])
            end
          end
        end

        it "displays invocation syntax and exists when arguments are missing" do
          assert_output("", /Syntax: .* <day number> <input file>/) do
            assert_raises(SystemExit) do
              AoC2023.main([])
            end
          end
        end

        it "displays an error when day number is not an integer" do
          assert_output("", "Invalid day number: foo\nDay number must be an integer\n") do
            assert_raises(SystemExit) do
              AoC2023.main(["foo", "input.txt"])
            end
          end
        end

        it "displays an error when day number is not valid" do
          assert_output("", /Invalid day number: 26\nValid day numbers: .*\n/) do
            assert_raises(SystemExit) do
              AoC2023.main(["26", "input.txt"])
            end
          end
        end

        it "displays an error when input file does not exist" do
          assert_output("", "Invalid input file: /tmp/this_better_not_exists.txt\n") do
            assert_raises(SystemExit) do
              AoC2023.main(["1", "/tmp/this_better_not_exists.txt"])
            end
          end
        end
      end
    end
  end
end
