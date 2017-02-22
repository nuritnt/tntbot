require_relative "../environment.rb"
require 'slack-ruby-bot'
require 'curb'

class Bot < SlackRubyBot::Bot
  command 'ping' do |client, data, _match|
    client.say(text: "pong'd from tnt's device mofo", channel: data.channel)
  end

  match /(?<link>https?:\/\/(?:www\.|(?!www))[^\s\.]{4,}+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/ do |client, data, match|
    client.say(channel: data.channel, text: "yay, you just posted an evilish link: #{match[:link]} - I add it to my database! #{data.inspect}")
    Link.create(
      url: match[:link],
      channel_id: data.channel,
      user_id: data.user
    )
  end

end


SlackRubyBot::Client.logger.level = Logger::WARN

Bot.run
