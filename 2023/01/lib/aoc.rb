#!/usr/bin/env ruby
# frozen_string_literal: true

class Day01
  def initialize(lines)
    @lines = lines
  end

  def part1_sum
    @lines.map { |line| line_to_num(line) }.sum
  end

  def part2_sum
    replacements = {
      'one' => 'o1e', 'two' => 't2o', 'three' => 't3e', 'four' => 'f4r', 'five' => 'f5e',
      'six' => 's6x', 'seven' => 's7n', 'eight' => 'e8t', 'nine' => 'n9e'
    }
    @lines.map do |line|
      replacements.each { |find, replace| line.gsub!(find, replace) }
      line_to_num(line)
    end.sum
  end

  private

  def line_to_num(line)
    first_num = last_num = nil
    line.each_char do |c|
      if c =~ /[0-9]/
        first_num ||= c
        last_num = c
      end
    end
    "#{first_num}#{last_num}".to_i
  end
end
