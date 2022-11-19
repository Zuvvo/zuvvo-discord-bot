# frozen_string_literal: true

module Types
  class MathGameResultType < Types::BaseObject
    field :id, ID, null: false
    field :math_game_id, Integer, null: false
    field :discord_user_id, Integer, null: false
    field :points, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :math_game, MathGameType, null: true
  end
end
