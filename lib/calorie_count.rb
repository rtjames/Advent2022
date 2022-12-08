def sum_max_calorie_counts(input, counts_num = 1)
  # array of integers
  calorie_counts = Array.new(1, 0)

  until input.eof
    line = input.readline.chomp
    if line.empty?
      calorie_counts << 0
    else
      calories = Integer(line)
      calorie_counts[-1] += calories
    end
  end

  calorie_counts.max(counts_num).sum
end
