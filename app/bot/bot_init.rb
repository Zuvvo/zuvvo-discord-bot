require 'discordrb'

bot = Discordrb::Bot.new token: ENV['DISCORD_TOKEN']

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong localhost bot_init.rb'
end

bot.run