class MathGameResult < ApplicationRecord
  belongs_to :math_game
  belongs_to :user
end
