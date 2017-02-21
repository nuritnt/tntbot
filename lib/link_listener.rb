require 'slack-ruby-bot'
require 'curb'

class Bot < SlackRubyBot::Bot
  command 'ping' do |client, data, _match|
    client.say(text: "pong'd from tnt's device mofo", channel: data.channel)
  end
end

class Url < SlackRubyBot::Bot
  match /https?:\/\/[\S]+/ do |client, data, match|
    def self.call(client, data, match)
      client.say(channel: data.channel, text: 'yay, you just posted a linky link. congrats!', gif: 'congrats')
    end
end

class Url < SlackRubyBot::Bot
  match /^https?:\/\/[\S]+/ do |client, data, match|
    client.say(channel: data.channel, text: "yay, you just posted a linky link. congrats!")
  end
end

class Weather < SlackRubyBot::Bot
  match /^How is the weather in (?<location>\w*)\?$/ do |client, data, match|
    client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
  end
end

SlackRubyBot::Client.logger.level = Logger::WARN
Bot.run
Url.run
