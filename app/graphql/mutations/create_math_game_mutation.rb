module Mutations
  class CreateMathGameMutation < BaseMutation
    field :math_game, Types::MathGameType, null: false

    argument :results, String, required: true do
      description "These are the results of math game in a form of scoreboard"
    end

    argument :host_name, String, required: true do
      description "This is host user nickname"
    end

    argument :time, Int, required: true do
      description "This is time to solve each riddle set by host"
    end

    argument :difficulty, Int, required: true do
      description "This is difficulty of the game set by host"
    end

    def resolve(results:, host_name:, time:, difficulty:)
      @math_game = MathGame.new(discord_user: DiscordUser.find_or_create_by(name: host_name), time: time, difficulty: difficulty)
      @math_game.add_game_results(results)
      # puts @math_game.math_game_results.size
      if @math_game.save
        {
          math_game: @math_game,
          errors: []
        }
      else
        {
          math_game: nil,
          errors: @math_game.errors.full_messages
        }
      end
    end
  end
end