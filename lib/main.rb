# frozen_string_literal: true

require 'pathname'

# example input
# ruby main.rb -day 1 -part 2 -input "./data/day1.txt"

# Parameter Validation
day_flag_index = ARGV.find_index('-day')
if day_flag_index.nil?
    raise 'Parameter required: -day'
end

day = ARGV[day_flag_index + 1]
if day.nil? ||  day !~ /\A\d+\Z/
    raise 'Invalid parameter: -day should be followed by an integer i.e. -day 1'
end

part_flag_index = ARGV.find_index('-part')
if part_flag_index.nil?
    raise 'Parameter required: -part'
end

part = ARGV[part_flag_index + 1]
unless part == '1' || part == '2'
    raise 'Invalid parameter: -part should be followed by 1 or 2 i.e. -part 1'
end

input_flag_index = ARGV.find_index('-input')
if input_flag_index.nil?
    raise 'Parameter required: -input'
end

input_path = ARGV[input_flag_index + 1]
if input_path.nil? || (not File.exist?(input_path))
    raise 'Invalid parameter: -input should be followed by a valid file path i.e. -input "./data/day1.txt"'
end

# Start of the happy path
day = Integer day
part = Integer part
input = File.open(input_path, 'r')

case day
when 1
    require_relative 'calorie_count.rb'
    if part == 1
        # 74198
        answer = sum_max_calorie_counts(input)
    elsif part == 2
        # 209914
        answer = sum_max_calorie_counts(input, 3)
    end
when 2
    require_relative 'rock_paper_scissors.rb'
    if part == 1
        # 12645
        answer = calculate_match_scores(input)
    elsif part == 2
        # 11756
        answer = calculate_match_scores(input, :two)
    end
else
    puts "Day #{day} Part #{part} has not been added"
end

puts "Day #{day} Part #{part}: #{answer}"
