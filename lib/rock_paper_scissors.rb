# frozen_string_literal: true

$match_scores1 = {
  'A X' => 4, # draw + rock
  'A Y' => 8, # win + paper
  'A Z' => 3, # loss + scissors
  'B X' => 1, # loss + rock
  'B Y' => 5, # draw + paper
  'B Z' => 9, # win + scissors
  'C X' => 7, # win + rock
  'C Y' => 2, # loss + paper
  'C Z' => 6 # draw + scissors
}
$match_scores1.default = 0

$match_scores2 = {
  'A X' => 3, # loss + scissors
  'A Y' => 4, # draw + rock
  'A Z' => 8, # win + paper
  'B X' => 1, # loss + rock
  'B Y' => 5, # draw + paper
  'B Z' => 9, # win + scissors
  'C X' => 2, # loss + paper
  'C Y' => 6, # draw + scissors
  'C Z' => 7  # win + rock
}
$match_scores2.default = 0

def calculate_match_scores(input, mode = :one)
  match_scores = mode == :one ? $match_scores1 : $match_scores2

  total_score = 0
  until input.eof
    line = input.readline.chomp
    total_score += match_scores[line]
  end
  total_score
end
