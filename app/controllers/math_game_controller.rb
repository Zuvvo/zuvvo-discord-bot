class MathGameController < ApplicationController

  skip_forgery_protection

  def new
    @math_game = MathGame.new
  end

  def home
    @games = MathGame.all
  end

  def create
    p = params
    user = DiscordUser.find_or_create_by(name: p[:host])
    MathGame.new(discord_user: user, time: p[:time].to_i,
                        difficulty: p[:difficulty].to_i, riddles_count: p[:riddles_count].to_i,
                        results: p[:results]).save
  end

end