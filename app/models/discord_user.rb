class DiscordUser < ApplicationRecord

  def won_games
    MathGame.all.select { |game| game.winners.include?(name) }
  end

  def lost_games
    games_played.reject { |game| game.winners.include?(name) }
  end

  def games_played
    MathGame.all.select { |game| game.players.include?(name) }
  end

  def total_riddles_solved
    games_played.reduce(0) { |memo, game| memo + game.player_points(name) }
  end

  def total_riddles_participated
    games_played.reduce(0) { |memo, game| memo + game.riddles_count }
  end

  def good_answers_percent
    (total_riddles_solved / total_riddles_participated.to_f)
  end

  def preferred_difficulty
    puts "GAME PLAYED COUNT: #{games_played.count}"
    games_played.max_by(&:difficulty).difficulty
  end

end
