class CreateMathGameResults < ActiveRecord::Migration[7.0]
  def change
    create_table :math_game_results do |t|
      t.belongs_to :math_game, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end

  def self.up
    add_results_from_math_games
  end

  private

  def self.add_results_from_math_games
    MathGame.all.each do|game|
      game.players.each do|player|
        result = MathGameResult.new(math_game: game, user: DiscordUser.all.find_by(name: player))
        result.save
      end
    end
  end

end