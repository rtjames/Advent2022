# frozen_string_literal: true

require 'set'
require_relative 'advent_utils'

LETTERS = %w[a b c d e f g h i j k l m n o p q r s t u
             v w x y z A B C D E F G H I J K L M N O P Q R S T U
             V W X Y Z].freeze

def half_string(str)
  length = str.length / 2
  [str[0..(length - 1)], str[length..]]
end

def first_alphabet_intersect(strs)
  intersect = Set.new(LETTERS)
  strs.each do |str|
    intersect &= str.each_char
  end
  intersect.to_a.first
end

def get_item_priority(item)
  ordinal = item.ord
  case ordinal
  when 97..122
    ordinal - 96
  when 65..90
    ordinal - 38
  else
    0
  end
end

DAY3 = 'day3.txt'

input = get_input_file(DAY3)

priority_sum = 0
badge_priority_sum = 0
last_three_rucksacks = []

until input.eof
  line = input.readline.chomp
  compartments = half_string(line)
  duplicate_item = first_alphabet_intersect(compartments)
  duplicate_item_priority = get_item_priority(duplicate_item)
  priority_sum += duplicate_item_priority

  last_three_rucksacks << line

  # Every three lines find badge priorities
  next if input.lineno % 3 != 0

  triplicate_item = first_alphabet_intersect(last_three_rucksacks)
  badge_priority = get_item_priority(triplicate_item)
  badge_priority_sum += badge_priority
  last_three_rucksacks = []
end

# 7831
puts "Part 1: #{priority_sum}"

# 2683
puts "Part 2: #{badge_priority_sum}"
