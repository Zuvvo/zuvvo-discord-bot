require 'rails_helper'

describe MathGame, type: :model do
  it 'creates MathGame object using factory' do
    game = create(:math_game)
    expect(game).not_to be_nil
  end

  it 'creates MathGame object with temp user object built' do
    user = build(:discord_user)
    game = create(:math_game, discord_user: user)
    expect(game).not_to be_nil
    expect(game.discord_user).not_to be_nil
  end

  it 'checks if players are listed correctly in MathGame' do
    user = build(:discord_user)
    game = create(:math_game, discord_user: user, results: "[[\"One\", 2], [\"Two\", 2], [\"Three\", 1]]" )
    expect(game.players).to eq(['One', 'Two', 'Three'])
  end

  it 'checks if player is a winner with one player with the most points scored' do
    user = build(:discord_user)
    game = create(:math_game, discord_user: user, results: "[[\"One\", 5], [\"Two\", 2], [\"Three\", 1]]" )
    expect(game.winners).to eq(['One'])
  end

  it 'checks if player is a winner with two players with the most points scored' do
    user = build(:discord_user)
    game = create(:math_game, discord_user: user, results: "[[\"One\", 5], [\"Two\", 5], [\"Three\", 1]]" )
    expect(game.winners).to eq(['One', 'Two'])
  end

  it 'checks if player is a winner with two players with the most points scored, one on the bottom of scoreboard' do
    user = build(:discord_user)
    game = create(:math_game, discord_user: user, results: "[[\"One\", 5], [\"Two\", 2], [\"Three\", 2], [\"Four\", 5]]" )
    expect(game.winners).to eq(['One', 'Four'])
  end

end