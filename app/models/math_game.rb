class MathGame < ApplicationRecord
  belongs_to :discord_user

  def winners
    scoreboard = hash_results
    max = scoreboard.values.max
    scoreboard.select { |k, v| v == max }.keys
  end

  def players
    hash_results.keys
  end

  private

  def hash_results
    output = {}
    scores = results[1..].scan(/\[(.*?)\]/)
    scores.each do |arr|
      s = arr[0].split(', ')
      output[s[0].gsub('"', '')] = s[1].to_i
    end
    output
  end
end
