class MathGameController < ApplicationController

  skip_forgery_protection

  def new
    @math_game = MathGame.new
  end

  def create
    @math_game = MathGame.new
    p = math_game_params
    user = DiscordUser.find_or_create_by(name: p[:username])
    game = MathGame.new(discord_user: user, riddle: p[:riddle], time: p[:time], difficulty: p[:difficulty], points: p[:points])
    game.save
  end

  def math_game_params
    params.require(:math_game).permit(:username, :riddle, :time, :difficulty, :points)
  end

end