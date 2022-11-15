module MathGameHelper

  def create_links_for_players(players)
    paths = []
    players.each do |player|
      discord_user = DiscordUser.find_by(name: player)
      if !discord_user.nil? then
        s = link_to player, discord_user_path(discord_user)
        paths << s
      else
        paths << player
      end
    end
    paths.join(', ').html_safe
  end

end
