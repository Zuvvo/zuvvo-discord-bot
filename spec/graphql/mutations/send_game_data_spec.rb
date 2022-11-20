require 'rails_helper'

describe 'mutation send game data' do
  it 'creates new math game for 3 players with Example host name' do
    query = <<~GQL
      mutation save_test {
        createMathGameMutation(
          input: {results: "[[\\"One\\", 5], [\\"Two\\", 5], [\\"Three\\", 1]]",
            hostName: "Example",
            time: 30,
            difficulty: 1,
            riddlesCount: 5}
        ) {
          mathGame {
            id
          }
        }
      }
    GQL

    result = ZuvvoDiscordBotSchema.execute(query)
    expect(result.dig('data', 'createMathGameMutation', 'mathGame')).not_to be_blank
  end
end
