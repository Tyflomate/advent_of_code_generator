# frozen_string_literal: true

module AdventOfCodeGenerator
  module Commands
    module BaseCommand
      def day
        @day ||= options[:day]
      end

      def day_name
        return day.to_s if day > 9

        "0#{day}"
      end

      def solution_file_path
        "#{day_name}/day#{day_name}.rb"
      end

      def input_file_path
        "#{day_name}/input.txt"
      end

      def year
        @year ||= options[:year]
      end
    end
  end
end
