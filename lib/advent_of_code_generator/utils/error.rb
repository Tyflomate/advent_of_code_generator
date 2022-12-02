# frozen_string_literal: true
module AdventOfCodeGenerator
  class Error < StandardError
    def message
      raise NotImplementedError
    end
  end

  class InvalidDayError < Error
    def message
      "Please use an integer between 1 and 25 as day argument."
    end
  end

  class InvalidYearError < Error
    def message
      "Please insert a valid year between the first iteration of 2015 and current year."
    end
  end
end
