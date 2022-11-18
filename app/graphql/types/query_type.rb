module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :mathGamesCount, Integer, null: false,
          description:  "Query that returns how many math games were played"

    field :mathGames, [Types::MathGameType], null: false,
          description: "This is query that selects all math games"

    def mathGames
      MathGame.all
    end

    def mathGamesCount
      puts "games count method"
      MathGame.count
    end
  end
end