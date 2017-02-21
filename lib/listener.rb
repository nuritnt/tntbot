require 'slack-ruby-client'
require 'eventmachine'
require 'faye/websocket'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
  case data.text
  when 'bot hi' then
    client.message channel: data.channel, text: "Hi <@#{data.user}> from tnt!"
  when /bot/ then
    client.message channel: data.channel, text: "Sorry <@#{data.user}>, what?"
  when /https?:\/\/[\S]+/ then
    links = URI.extract(data.text)
    client.message channel: data.channel, text: "You just posted a link."
  end
end

client.on :close do |_data|
  puts "Client is about to disconnect"
end

client.on :closed do |_data|
  puts "Client has disconnected successfully!"
end

client.start!
