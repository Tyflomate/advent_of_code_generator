# frozen_string_literal: true

require "thor"
require "pry"
require_relative "advent_of_code_generator/version"

module AdventOfCodeGenerator
  class Error < StandardError; end

  class App < Thor
    include Thor::Actions

    map "-g" => :toto

    option :day, :type => :numeric, :required => true, :aliases => "-d"
    option :year, :type => :numeric, :aliases => "-y"
    desc "toto", "generate files for a day"
    def toto
      day = parse_day(options[:day])
      year = parse_year(options[:year])
      puts "generating day #{day} of year #{year}"
    end

    def self.exit_on_failure?
      true
    end

    private

    def parse_day(day)
      return day if day > 0 && day < 26

      say "Please use an integer between 1 and 25 as day argument.", :red
    end

    def parse_year(year)
      current_year = Time.now.year
      return current_year unless year
      return year if year <= current_year && year > 2014

      say "Please insert a valid year between the first iteration of 2015 and current year.", :red
    end
  end
end
