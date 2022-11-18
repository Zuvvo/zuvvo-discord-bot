class MathGameResult < ApplicationRecord
  belongs_to :math_game
  belongs_to :discord_user
end
