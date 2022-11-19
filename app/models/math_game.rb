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

  def add_game_results(results)
    output = {}
    scores = results[1..].scan(/\[(.*?)\]/)
    scores.each do |arr|
      s = arr[0].split(', ')
      output[s[0].gsub('"', '')] = s[1].to_i
    end
    output
    output.sort_by { |k, v| v }.reverse.to_h
    output.each do |k, v|
      user = DiscordUser.find_or_create_by(name: k)
      result = MathGameResult.new(math_game: self, discord_user: user, points: v)
      math_game_results << result
      result.save
    end
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
