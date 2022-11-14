require 'rails_helper'

describe MathGame do
  it 'creates empty MathGame object' do
    game = MathGame.new
    expect(game).not_to be_nil
  end
end

describe MathGame, type: :model do
  it 'creates empty MathGame object using factory' do
    game = create(:math_game)
    expect(game).not_to be_nil
  end

  it 'creates empty MathGame object with user from db reference' do
    user = create(:discord_user)
    game = create(:math_game, discord_user: user)
    expect(game).not_to be_nil
  end

end