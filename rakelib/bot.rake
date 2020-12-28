require 'cucumber'
require 'cucumber/rake/task'
require 'telegram/bot'

Cucumber::Rake::Task.new(:run_bot) do
  TOKEN = "1342630719:AAFCrHb_rspHDOvy4fnd929mQh66hXP8tMQ".freeze
  CHAT_ID = "620803358".freeze

  logs = File.read("log.txt")

  Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.api.send_message(
      chat_id: CHAT_ID,
      text: logs
    )
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(
          chat_id: message.chat.id,
          text: "Привіт, #{message.from.first_name}"
        )
      when '/last_results'
        bot.api.send_message(
          chat_id: message.chat.id,
          text: logs
        )
      end
    end
  end
end