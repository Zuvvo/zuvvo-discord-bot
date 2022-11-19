class RemoveResultsFromMathGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :math_games, :results, :string
  end
end
