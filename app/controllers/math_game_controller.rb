class MathGameController < ApplicationController

  skip_forgery_protection

  def new
    @math_game = MathGame.new
  end

  def create
    p = params
    user = DiscordUser.find_or_create_by(name: p[:username])
    game = MathGame.new(discord_user: user, riddle: p[:riddle], time: p[:time], difficulty: p[:difficulty], points: p[:points])
    game.save
  end

end