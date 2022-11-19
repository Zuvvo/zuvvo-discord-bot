# frozen_string_literal: true

module Types
  class DiscordUserType < Types::BaseObject
    field :id, ID, null: false do description "This is discord user id" end
    field :name, String do description "This is discord user name" end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do description "This is discord user created at time" end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do description "This is discord user updated at time" end
  end
end
