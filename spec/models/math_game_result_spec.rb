require 'rails_helper'

RSpec.describe MathGameResult, type: :model do
  it 'it checks if game results are created for 3 players game' do
    user = build(:discord_user)
    game = create(:math_game, discord_user: user)
    game.add_game_results("[[\"One\", 2], [\"Two\", 2], [\"Three\", 1]]")
    expect(game.math_game_results.size).to eq(3)
  end
end
