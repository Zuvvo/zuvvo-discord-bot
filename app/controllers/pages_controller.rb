class PagesController < ApplicationController
  def home
    @games = MathGame.all
  end
end
