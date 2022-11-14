FactoryBot.define do
  factory :math_game do
    discord_user { DiscordUser.new }
  end
end