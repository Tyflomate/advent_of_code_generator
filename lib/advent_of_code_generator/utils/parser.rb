# frozen_string_literal: true

module AdventOfCodeGenerator
  module Parser
    def parse_day(day)
      return day_to_string(day) if day > 0 && day < 26

      raise InvalidDayError
    end

    def parse_year(year)
      current_year = Time.now.year
      return current_year unless year
      return year if year <= current_year && year > 2014

      raise InvalidYearError
    end

    private

    def day_to_string(day)
      return day.to_s if day > 9

      "0#{day}"
    end
  end
end
