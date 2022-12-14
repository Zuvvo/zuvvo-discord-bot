class CreateMathGames < ActiveRecord::Migration[7.0]
  def change
    create_table :math_games do |t|
      t.belongs_to :discord_user, null: true, foreign_key: true
      t.integer :time
      t.integer :difficulty
      t.integer :riddles_count
      t.string :results

      t.timestamps
    end
  end
end
