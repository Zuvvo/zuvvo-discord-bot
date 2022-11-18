class CreateMathGameResults < ActiveRecord::Migration[7.0]
  def change
    create_table :math_game_results do |t|
      t.belongs_to :math_game, null: false, foreign_key: true
      t.belongs_to :discord_user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
    add_results_from_math_games
  end

  def add_results_from_math_games
    MathGame.all.each do|game|
      game.players.each do|player|
        result = MathGameResult.new(math_game: game, discord_user: DiscordUser.all.find_by(name: player), points: game.player_points(player))
        result.save
      end
    end
  end

end