# frozen_string_literal: true

require "thor"
require_relative "advent_of_code_generator/utils"
require_relative "advent_of_code_generator/commands"

module AdventOfCodeGenerator
  class Error < StandardError; end

  class App < Thor
    include Thor::Actions
    include AdventOfCodeGenerator::Parser

    map "g" => :generate
    map "s" => :solve

    option :day, :type => :numeric, :required => true, :aliases => "-d"
    option :year, :type => :numeric, :aliases => "-y"
    desc "generate", "generate files for a day"
    def generate
      day = parse_day(options[:day])
      year = parse_year(options[:year])

      invoke 'generateDay', [], :day => day, :year => year
    rescue AdventOfCodeGenerator::Error => e
      say e.message, :red
    end

    option :day, :type => :numeric, :required => true, :aliases => "-d"
    option :year, :type => :numeric, :aliases => "-y"
    option :part, :type => :numeric
    desc "solve", "Print results of your solution"
    def solve
      day = parse_day(options[:day])
      year = parse_year(options[:year])

      invoke 'solveDay', ['start'], :day => day, :year => year, :part => options[:part]
    rescue AdventOfCodeGenerator::Error => e
      say e.message, :red
    end

    register(AdventOfCodeGenerator::Commands::GenerateDay, "generateDay", "generateDay", "Generate days files")

    desc "solveDay", 'Prints results for your solution'
    subcommand "solveDay", AdventOfCodeGenerator::Commands::SolveDay

    def self.exit_on_failure?
      true
    end
  end
end
