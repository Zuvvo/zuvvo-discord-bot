class MathGameController < ApplicationController
  def new

  end

  def create
    puts "create request"
  end

  def math_game_params
    #params.require(:message).permit(:body, :spot_id)
  end

end
