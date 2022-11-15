class MathGame < ApplicationRecord
  belongs_to :discord_user

  def winner
    scoreboard = hash_results
    scoreboard.key(scoreboard.values.max)
  end

  def players
    hash_results.keys.join(', ')
  end

  private
  def hash_results
    output = {}
    scores = results[1..-1].scan(/\[(.*?)\]/)
    scores.each do |arr|
      s = arr[0].split(', ')
      output[s[0].gsub("\"", '')] = s[1].to_i
    end
    output
  end
end
