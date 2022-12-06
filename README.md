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

This command will create a directory for the day DAY with the ruby file class to solve the puzzle and the input file.

For this command to work, we need to use you Advent of code session cookie in order to fetch your input. You can find
it in the cookies of https://adventofcode.com/2022/day/DAY/input. Add it to you environment variables as:

```
export AOC_COOKIE=COOKIE
```

To generate a day of the current year, run:

    $ bundle exec aoc generate --day DAY

You will have an output like the following:

```
Creating day 1 directory
Creating day 1 solution file
      create  01/day01.rb
Creating day 1 input file
      create  01/input.txt
Generation done, enjoy !

```

### Solve

This command will print in your terminal the result of your solution for the day DAY.

To do so, run:

    $ bundle exec aoc solve --day DAY

You will have an output like the following:

```
Loading solution file...
Resolving part 1...
Part 1 result: 579
Resolving part 2...
Part 2 result: 567
```

### Publish

Incomming command

## Contributing

Bug reports and pull requests are welcome on this GitHub repository.
