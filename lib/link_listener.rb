require_relative "../environment.rb"
require 'slack-ruby-bot'
require 'curb'
require 'uri'
require 'nokogiri'
require 'open_uri_redirections'

class Bot < SlackRubyBot::Bot
  command 'show list', 'show links' do |client, data, _match|
    client.say(text: "hi <@#{data.user}>, you can have a look on the list here: https://tntbot-list.herokuapp.com/ ", channel: data.channel)
  end

  command 'ping' do |client, data, _match|
    client.say(text: "hi <@#{data.user}>, you got pong'd from tnt's device,", channel: data.channel)
  end

  match(/(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix) do |client, data, match|
    url = match.to_s.gsub(">", '')
    link = Link.find_or_initialize_by(url: url)
    title = Nokogiri::HTML(open(url, allow_redirections: :all)).css('title').text
    if link.new_record?
      link.update_attributes(
        title: title,
        channel_id: data.channel,
        user_id: data.user
      )
      link.save
      client.say(channel: data.channel, text: "successfully saved to database.")
    else
      link.touch
      client.say(channel: data.channel, text: "already in my database.")
    end
  end
end


SlackRubyBot::Client.logger.level = Logger::WARN

Bot.run
