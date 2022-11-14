require 'rails_helper'

describe MathGame do
  it 'creates empty MathGame object' do
    game = MathGame.new
    expect(game).not_to be_nil
  end
end

RSpec.describe MathGame, type: :model do
  it 'creates empty MathGame object using factory' do
    game = create(:math_game)
    expect(game).not_to be_nil
  end
end