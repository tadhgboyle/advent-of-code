module Year2022
  class Day02
    OPPONENT_ROCK = "A"
    OPPONENT_PAPER = "B"
    OPPONENT_SCISSORS = "C"

    SELF_ROCK = "X"
    SELF_PAPER = "Y"
    SELF_SCISSORS = "Z"

    SCORE_ROCK = 1
    SCORE_PAPER = 2
    SCORE_SCISSORS = 3

    SCORE_LOSS = 0
    SCORE_DRAW = 3
    SCORE_WIN = 6

    SHOULD_LOSE = "X"
    SHOULD_DRAW = "Y"
    SHOULD_WIN = "Z"

    LOSING_MOVES = {
      OPPONENT_ROCK => SELF_SCISSORS,
      OPPONENT_PAPER => SELF_ROCK,
      OPPONENT_SCISSORS => SELF_PAPER,
    }

    WINNING_MOVES = {
      OPPONENT_ROCK => SELF_PAPER,
      OPPONENT_PAPER => SELF_SCISSORS,
      OPPONENT_SCISSORS => SELF_ROCK,
    }

    DRAW_MOVES = {
      OPPONENT_ROCK => SELF_ROCK,
      OPPONENT_PAPER => SELF_PAPER,
      OPPONENT_SCISSORS => SELF_SCISSORS,
    }

    def part1(input)
      total_score = 0

      input.each_line do |line|
        opponent_move, self_move = line.split(" ")
        round_score = score(opponent_move, self_move)
        round_score += bonus(self_move)

        total_score += round_score
      end

      total_score
    end

    def part2(input)
      total_score = 0

      input.each_line do |line|
        opponent_move, self_outcome = line.split(" ")
        if self_outcome == SHOULD_LOSE
          self_move = LOSING_MOVES[opponent_move]
        elsif self_outcome == SHOULD_DRAW
          self_move = DRAW_MOVES[opponent_move]
        elsif self_outcome == SHOULD_WIN
          self_move = WINNING_MOVES[opponent_move]
        end

        round_score = score(opponent_move, self_move)
        round_score += bonus(self_move)

        total_score += round_score
      end

      total_score
    end

    private

    def score(opponent_move, self_move)
      if WINNING_MOVES[opponent_move] == self_move
        SCORE_WIN
      elsif DRAW_MOVES[opponent_move] == self_move
        SCORE_DRAW
      elsif LOSING_MOVES[opponent_move] == self_move
        SCORE_LOSS
      end
    end

    def bonus(self_move)
      case self_move
      when SELF_ROCK
        SCORE_ROCK
      when SELF_PAPER
        SCORE_PAPER
      when SELF_SCISSORS
        SCORE_SCISSORS
      end
    end
  end
end
