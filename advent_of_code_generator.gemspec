# frozen_string_literal: true

require_relative "lib/advent_of_code_generator/version"

Gem::Specification.new do |spec|
  spec.name = "advent_of_code_generator"
  spec.version = AdventOfCodeGenerator::VERSION
  spec.authors = ["Florian Lecointe"]
  spec.email = "florian@tymate.com"

  spec.summary = "Advent of code days implementation generator"
  spec.description = "Generate input and startup class for advent of code days"
  spec.homepage = "https://github.com/Tyflomate/advent_of_code_generator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Tyflomate/advent_of_code_generator"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'thor', '~> 1.2', '>= 1.2.1'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
