module DiscordUserHelper

  def self.get_link_to_user_page(username)
    user = DiscordUser.find_by(name: username)
    return root_path if user.nil?
    "#{discord_user_show_path.to_s}/#{user.id}/show"
  end

  def self.populate_database_with_players
    MathGame.all.each {|game| game.players.each { |player| DiscordUser.find_or_create_by(name: player )}}
  end

end
