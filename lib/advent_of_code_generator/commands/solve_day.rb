# frozen_string_literal: true

module AdventOfCodeGenerator
  module Commands
    class SolveDay < Thor
      include Thor::Actions
      include AdventOfCodeGenerator::Commands::BaseCommand

      map "s" => :solve_day

      option :day, :type => :numeric
      option :year, :type => :numeric
      option :part, :type => :numeric
      desc "start", "Prints your solutions to today parts"
      def start
        raise MissingInputFileError unless File.exist?(input_file_path)
        raise MissingSolutionFileError unless File.exist?(solution_file_path)

        say "Loading solution file..."
        load(solution_file_path)

        solve_part_one if solve_part_one?
        solve_part_two if solve_part_two?
      end

      private

      def part_option
        @part ||= options[:part]
      end

      def solve_part_one?
        part_option == 1 || part_option.nil?
      end

      def solve_part_two?
        part_option == 2 || part_option.nil?
      end

      def solve_part_one
        say "Resolving part 1..."
        solve_part(1)
      end

      def solve_part_two
        say "Resolving part 2..."
        solve_part(2)
      end

      def solve_part(part)
        result = Object.const_get("Day#{day_name}").new.send("part#{part}")

        say "Part #{part} result: #{result}\n"
      end
    end
  end
end
