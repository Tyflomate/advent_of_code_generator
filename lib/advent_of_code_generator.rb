# frozen_string_literal: true

require "thor"
require "pry"
require_relative "advent_of_code_generator/utils"
require_relative "advent_of_code_generator/generate_day"

module AdventOfCodeGenerator
  class Error < StandardError; end

  class App < Thor
    include Thor::Actions
    include AdventOfCodeGenerator::Parser

    map "-g" => :generate

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

    register(AdventOfCodeGenerator::GenerateDay, "generateDay", "generateDay", "Generate days files")

    def self.exit_on_failure?
      true
    end
  end
end
