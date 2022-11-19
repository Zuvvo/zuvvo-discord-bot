FactoryBot.define do
  factory :math_game do
    discord_user
    time { 10 }
    difficulty { 1 }
  end
end