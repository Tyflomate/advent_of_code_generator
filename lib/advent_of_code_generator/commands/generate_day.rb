# frozen_string_literal: true

require 'rest-client'

module AdventOfCodeGenerator
  module Commands
    class GenerateDay < Thor::Group
      include Thor::Actions
      include AdventOfCodeGenerator::Commands::BaseCommand

      class_option :day, :type => :numeric
      class_option :year, :type => :numeric

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_day_directory
        unless Dir.exist?(day_name)
          say "Creating day #{day} directory"
          Dir.mkdir(day_name)
        end
      end

      def create_solution_file
        say "Creating day #{day} solution file"
        template('templates/empty_day.tt', solution_file_path)
      end

      def create_input_file
        say "Creating day #{day} input file"
        create_file input_file_path, fetch_input
      end

      def prints_done
        say 'Generation done, enjoy !', :blue
      end

      private

      def fetch_input
        RestClient.get(
          "https://adventofcode.com/#{year}/day/#{day}/input",
          cookies: { session: ENV.fetch('AOC_COOKIE', '') },
          'User-Agent' => "github.com/Tyflomate/advent_of_code_generator by florian@tymate.com"
        ).body
      rescue RestClient::BadRequest, RestClient::ExceptionWithResponse => e
        e.response
      end
    end
  end
end
