# frozen_string_literal: true

require_relative "advent_of_code_generator/version"

module AdventOfCodeGenerator
  class Error < StandardError; end

  class App < Thor
    include Thor::Actions

    map "-g" => :generate

    method_option :day => :integer, :aliases => "-d"
    method_option :year => :integer, :aliases => "-y"
    desc "generate", "generate files for a day"
    def generate
      day = parse_day(options[:day])
      year = parse_year(options[:year])
      puts "generating day #{day} of year #{year}"
    end

    private

    def parse_day(day)
      parsed_day = day.to_i
      return parsed_day if parsed_day < 0 && parsed_day < 26

      say "Please use an integer between 1 and 25 as day argument.", :red
    end

    def parse_year(year)
      current_year = Time.now.year
      return current_year unless year

      parsed_year = year.to_i
      return parsed_year if parsed_year <= current_year && parsed_year > 2014

      say "Please insert a valid year between the first iteration of 2015 and current year.", :red
    end
  end
end
