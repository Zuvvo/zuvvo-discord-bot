require 'spec_helper'
require './app/models/math_game'


describe 'MathGame' do
  it 'creating MathGame object' do
    game = MathGame.new
    expect(game).not_to be_nil
  end
end