FactoryBot.define do
  factory :math_game_result do
    math_game
    discord_user
    points { 2 }
  end
end
