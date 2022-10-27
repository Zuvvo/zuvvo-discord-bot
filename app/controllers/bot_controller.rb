class BotController < ApplicationController
  require 'discordrb'

  attr_reader :bot

  def index
    @buttons_obj = ''
  end

  def create
    test_run_bot if params[:run]
    nameless_test if params[:test]
    close_bot if params[:close]
  end

  def test_run_bot
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)#, client_id: Rails.application.credentials.dig(:discord, :app_id)

    bot.message(with_text: 'Ping!') do |event|
      event.respond 'Pong!'
    end

    bot.run
  end

  def nameless_test
    puts "test?"
  end

  def close_bot
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)
    puts "bot nil? #{bot.nil?}"
    bot.stop unless bot.nil?
  end


end
