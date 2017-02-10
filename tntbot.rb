require 'slack-ruby-bot'
require 'curb'

class Bot < SlackRubyBot::Bot
  command 'ping' do |client, data, _match|
    client.say(text: 'pong', channel: data.channel)
  end
end

class Bot < SlackRubyBot::Bot
  command 'pong' do |client, data, _match|
    client.say(text: 'ping', channel: data.channel)
  end
end

class Bot < SlackRubyBot::Bot
  command 'wasabi' do |client, data, _match|
    client.say(text: 'waaazzzzaaabeyyyy', channel: data.channel)
  end
end

class Pizza < SlackRubyBot::Commands::Base
  command 'hungry'

    def self.call(client, data, match)
      client.say(channel: data.channel, text: 'want some pizza?', gif: 'pizza')
      # Sends the text 'want some pizza?' and a random GIF that matches the keyword 'pizza'.
    end
  end


  # class Catapi < SlackRubyBot::Commands::Base
  #   command 'howdy'
  #
  #     def self.call(client, data, match)
  #       client.say(channel: data.channel, text: 'caturday?', gif: 'http://thecatapi.com/?id=dsa')
  #       # Sends the text 'want some pizza?' and a random GIF that matches the keyword 'pizza'.
  #     end
  #   end

    class Catapi < SlackRubyBot::Bot
      command 'howdy' do |client, data, _match|
        client.say(text: 'http://thecatapi.com/api/images/get?format=src&type=gif', channel: data.channel)
      end
    end

SlackRubyBot::Client.logger.level = Logger::WARN

Bot.run
Pizza.run
Catapi.run
