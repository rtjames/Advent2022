require_relative 'advent_utils'

DAY1 = 'day1.txt'

input = get_input_file(DAY1)

# array of integers
calorie_counts = Array.new(1, 0)

while not input.eof
    line = input.readline.chomp
    if line.empty?
        calorie_counts << 0
    else
        calories = Integer(line)
        calorie_counts[-1] += calories
    end
end

# Part 1: 74198
puts "Part 1: #{ calorie_counts.max }"

# Part 2: 209914
puts "Part 2: #{ calorie_counts.max(3).sum }"