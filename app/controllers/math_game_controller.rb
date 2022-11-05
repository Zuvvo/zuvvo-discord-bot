class MathGameController < ApplicationController

  skip_forgery_protection

  def new
    @math_game = MathGame.new
  end

  def create
    p = params
    user = DiscordUser.find_or_create_by(name: p[:host])
    MathGame.new(discord_user: user, time: p[:time],
                        difficulty: p[:difficulty], riddles_count: p[:riddles_count],
                        results: p[:results]).save
  end

end