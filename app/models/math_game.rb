class MathGame < ApplicationRecord
  belongs_to :discord_user
  has_many :math_game_results

  def winners
    scoreboard = hash_results
    max = scoreboard.values.max
    scoreboard.select { |k, v| v == max }.keys
  end

  def players
    math_game_results.to_a.map { |result| result.discord_user.name }
  end

  def player_points(name)
    hash_results[name]
  end

  private

  def hash_results
    output = {}
    scores = math_game_results.to_a.each do |result|
      output[result.discord_user.name] = result.points
    end
    output.sort_by { |k, v| v }.reverse.to_h
  end
end
