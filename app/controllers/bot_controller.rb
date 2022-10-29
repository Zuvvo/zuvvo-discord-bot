class BotController < ApplicationController
  require 'discordrb'

  attr_reader :bot

  def index
    @buttons_obj = ''
  end

  def create
    test_run_bot if params[:run]
    test_run_bot_in_background if params[:test]
    close_bot if params[:close]
    websocket_test if params[:websockets]
  end

  def test_run_bot
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)#, client_id: Rails.application.credentials.dig(:discord, :app_id)

    bot.message(with_text: 'Ping!') do |event|
      event.respond 'Pong localhost!'
    end

    bot.run
  end

  def test_run_bot_in_background
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)#, client_id: Rails.application.credentials.dig(:discord, :app_id)

    bot.message(with_text: 'Ping!') do |event|
      event.respond 'Pong in background test localhost!'
    end
    bot.run(true)
    thread = bot.join
  end

  def websocket_test
    byebug
    WebSocket::Client::Simple::Client
  end

  def close_bot
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)
    puts "bot nil? #{bot.nil?}"
    bot.stop unless bot.nil?
  end


end
