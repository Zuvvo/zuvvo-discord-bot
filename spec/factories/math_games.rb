FactoryBot.define do
  factory :math_game do
    discord_user
    results { "[[\"First\", 2], [\"Second\", 2], [\"Third\", 1]]" }
  end
end