require 'telegram/bot'

TOKEN = "1342630719:AAFCrHb_rspHDOvy4fnd929mQh66hXP8tMQ".freeze
ANSWER = ["Не знаю що тобі сказати", "Я знаю що сказати"]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Привіт, #{message.from.first_name}"
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWER.sample)
    end
  end
end
