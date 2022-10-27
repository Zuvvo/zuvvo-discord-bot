class BotController < ApplicationController
  def index
    @buttons_obj = ''
  end

  def create
    test_run_bot if params[:run]
    nameless_test if params[:test]
  end

  def test_run_bot
    puts "running bot?"
  end

  def nameless_test
    puts "test?"
  end


end
