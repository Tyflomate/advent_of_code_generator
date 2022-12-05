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

  class MissingSolutionFileError < Error
    def message
      "There is no solution file to execute. Please run generate command first"
    end
  end

  class MissingInputFileError < Error
    def message
      "There is no input file to read. Please run generate command first"
    end
  end
end
