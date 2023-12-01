#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/aoc'

def run_aoc(input_file)
  lines = File.readlines(input_file, chomp: true)
  aoc = Day01.new(lines)

  puts "Part 1: #{aoc.part1_sum}"
  puts "Part 2: #{aoc.part2_sum}"
end

if $PROGRAM_NAME == __FILE__
  if ARGV.empty?
    puts "Usage: #{__FILE__} <input_file>"
    exit 1
  end

  input_file = ARGV[0]
  run_aoc(input_file)
end
