# frozen_string_literal: true

module Types
  class MathGameType < Types::BaseObject
    field :id, ID, null: false do description "This is game id" end
    field :discord_user_id, Integer do description "This is host discord user id" end
    field :time, Integer do description "This is time for each riddle" end
    field :difficulty, Integer do description "This is difficulty of the game. Easy, mid, hard (1-3)" end
    field :riddles_count, Integer do description "How many riddles were given for players" end
    field :results, String do description "This is scoreboard with players and their results" end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do description "Created at in db" end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do description "Updated at in db" end
  end
end
