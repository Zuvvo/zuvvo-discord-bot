# frozen_string_literal: true

module Types
  class MathGameResultType < Types::BaseObject
    field :id, ID, null: false do description "This is math game result id" end
    field :math_game_id, Integer, null: false do description "This is associated game id to this result" end
    field :discord_user_id, Integer, null: false do description "This is id of user who got this result" end
    field :points, Integer do description "This is how many points discord user received in this game" end
    field :math_game, MathGameType, null: true do description "This is associated game to this result" end
    field :discord_user, DiscordUserType, null: false do description "This is user who got this result" end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do description "This is math game result created at time" end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do description "This is math game result updated at time" end
  end
end
