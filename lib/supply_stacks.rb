# frozen_string_literal: true

require_relative 'advent_utils'

LETTER_REGEX = /[A-Za-z]/
NUMBER_REGEX = /[0-9]+/
DAY5 = 'day5.txt'

input = get_input_file(DAY5)

lines = input.readlines.map(&:chomp)

stack_name_line_index = lines.find_index {|line| line.include?('1')}

# Get number of stacks
last_stack_name = lines[stack_name_line_index].reverse.each_char.find {|i| i =~ NUMBER_REGEX}
stacks_count = Integer(last_stack_name)

# Init stacks
stacks = []
stacks_count.times {stacks << []}

# Set up initial stacks
(0..(stack_name_line_index - 1)).reverse_each do |line_index|
    line = lines[line_index]
    stack_num = 0
    (1..line.length).step(4) do |letter_index|
        stack = stacks[stack_num]
        letter = line[letter_index]
        
        if letter.match?(LETTER_REGEX)
            stack.push(letter) 
        end
        stack_num += 1
    end      
end

def move_stacks_single(stacks, instructions)
    stacks = stacks.dup
    instructions.each do |instruction|
        if matches = instruction.match(/move (?<quantity>\d+) from (?<stack_a>\d+) to (?<stack_b>\d+)/)
            quantity = Integer(matches[:quantity])
            stack_a = Integer(matches[:stack_a]) - 1
            stack_b = Integer(matches[:stack_b]) - 1
            quantity.times {stacks[stack_b].push(stacks[stack_a].pop)}
        end
    end
    stacks
end

def move_stacks_multiple(stacks, instructions)
    stacks = stacks.dup
    instructions.each do |instruction|
        if matches = instruction.match(/move (?<quantity>\d+) from (?<stack_a>\d+) to (?<stack_b>\d+)/)
            quantity = Integer(matches[:quantity])
            stack_a = Integer(matches[:stack_a]) - 1
            stack_b = Integer(matches[:stack_b]) - 1
            crates = stacks[stack_a].pop(quantity)
            crates.each {|crate| stacks[stack_b].push(crate)}
        end
    end
    stacks
end

def get_top_crates(stacks)
    top_crates = ""
    stacks.each do |stack|
        top_crates += stack.last || ""
    end
    top_crates
end

instructions = lines[(stack_name_line_index + 2)..]
# stacks_1 = move_stacks_single(stacks, instructions)
# top_crates_1 = get_top_crates(stacks_1)

stacks_2 = move_stacks_multiple(stacks, instructions)
top_crates_2 = get_top_crates(stacks_2)

#  FCVRLMVQP
# puts "Part 1: #{top_crates_1}"

# RWLWGJGFD
puts "Part 2: #{top_crates_2}"