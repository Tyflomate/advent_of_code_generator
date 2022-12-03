# AdventOfCodeGenerator

A custom gem that allows you to generate the necessary files to solve [Advent of Code](https://advent-of-code.com) days in Ruby !

This project is based on [advent_of_code_cli](https://github.com/egiurleo/advent_of_code_cli). Pretty much the same
usage but I wanted to make my own because why not ! Go check it out 👌

## Installation

You can add this line to your Gemfile:

    $ gem "advent_of_code_generator"

Then run bundle install and your up to go !

## Usage

### Generate

For this gem to work, we need to use you Advent of code session cookie in order to fetch your input. You can find
it in the cookies of https://adventofcode.com/2022/day/DAY/input. Add it to you environment variables as:

```
export AOC_COOKIE=COOKIE
```

To generate a day of the current year, run:

    $ bundle exec aoc generate --day DAY

This will create a directory for the day DAY with the ruby file class to solve the puzzle and the input file.

### Solve

Incomming command

### Publish

Incomming command

## Contributing

Bug reports and pull requests are welcome on this GitHub repository.
