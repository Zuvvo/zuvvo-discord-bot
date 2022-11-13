class MathGame < ApplicationRecord
  belongs_to :discord_user

  def winner
    scoreboard = hash_results
    scoreboard.key(scoreboard.values.max)
  end

  def players
    hash_results.keys.join(', ')
  end

  def detailed_scores
    scoreboard = hash_results.sort_by {|k,v| v}.reverse
    puts "#{scoreboard}"
    scoreboard.join(':<br>')
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
