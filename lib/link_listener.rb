require_relative "../environment.rb"
require 'slack-ruby-bot'
require 'slack-ruby-client'
require 'curb'
require 'eventmachine'
require 'faye/websocket'

class Bot < SlackRubyBot::Bot
  command 'ping' do |client, data, _match|
    client.say(text: "pong'd from tnt's device mofo", channel: data.channel)
  end

  match /(https?:\/\/(?:www\.|(?!www))[^\s\.]{4,}+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/ do |client, data, match|
    client.say(channel: data.channel, text: "#{match[:link]} yay, you just posted an evilish link. - added to my sneaky database!")
    Link.create(
      url: match[:link],
      channel_id: data.channel,
      user_id: data.user
    )
  end

end


SlackRubyBot::Client.logger.level = Logger::WARN

Bot.run
#
# when /https?:\/\/[\S]+/ then
#   links = URI.extract(data.text)
#   client.message channel: data.channel, text: "You just posted a link."
# end
# client.message channel: data.channel, text: "Sorry <@#{data.user}>, what?"
