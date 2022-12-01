DAY_ONE_PATH = '../data/day1.txt'

input = File.open(DAY_ONE_PATH, "r")

food_inventory = Array.new(1, Array.new)

while not input.eof
    line = input.readline.chomp
    if line.empty?
        food_inventory << Array.new
    else
        calories = Integer(line)
        food_inventory[-1] << calories
    end
end

calorie_counts = food_inventory.map { |calories| calories.sum }

# Part 1: 74198
puts "Part 1: #{calorie_counts.max}"

puts "Part 2: #{calorie_counts.max(3).sum}"