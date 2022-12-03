# frozen_string_literal: true

require 'rest-client'

module AdventOfCodeGenerator
  class GenerateDay < Thor::Group
    include Thor::Actions

    class_option :day, :type => :numeric
    class_option :year, :type => :numeric

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_day_directory
      unless Dir.exist?(day_name)
        say "Creating day #{day} directory", :green
        Dir.mkdir(day_name)
      end
    end

    def create_solution_file
      say "Creating day #{day} solution file", :green
      template('templates/empty_day.tt', "#{day_name}/day#{day_name}.rb")
    end

    def create_input_file
      say "Creating day #{day} input file", :green
      create_file "#{day_name}/input.txt", fetch_input
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

    def day
      @day ||= options[:day]
    end

    def day_name
      return day.to_s if day > 9

      "0#{day}"
    end

    def year
      @year ||= options[:year]
    end
  end
end
