require 'slack-ruby-bot'
require 'curb'

class Bot < SlackRubyBot::Bot
  command 'ping' do |client, data, _match|
    client.say(text: "pong'd from tnt's device mofo", channel: data.channel)
  end
end

class Url < SlackRubyBot::Bot
  match /(?<link>https?:\/\/(?:www\.|(?!www))[^\s\.]{4,}+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/ do |client, data, match|
    client.say(channel: data.channel, text: "yay, you just posted a evilish link: #{match[:link]} - congrats!", gif: 'notbad')
  end
end

SlackRubyBot::Client.logger.level = Logger::WARN

Bot.run
Url.run