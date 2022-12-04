# frozen_string_literal: true

require_relative 'advent_utils'

def ranges_overlap?(range_a, range_b)
  range_b.begin <= range_a.end && range_a.begin <= range_b.end
end

DAY4 = 'day4.txt'

input = get_input_file(DAY4)

fully_contains_count = 0
overlap_count = 0

until input.eof
  line = input.readline.chomp
  pairs = line.split(',')

  pairs = pairs.map do |pair|
    pair = pair.split('-')
    start_code = Integer(pair[0])
    end_code = Integer(pair[1])
    (start_code..end_code)
  end

  if pairs[0].cover?(pairs[1]) || pairs[1].cover?(pairs[0])
    fully_contains_count += 1
  end
  
  overlap_count += 1 if ranges_overlap?(pairs[0], pairs[1])
end

# 550
puts "Part 1: #{fully_contains_count}"

# 931
puts "Part 2: #{overlap_count}"
