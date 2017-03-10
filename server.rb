require 'sinatra'
require './environment.rb'
get '/' do
  @links = Link.all
  erb :home, layout: :application
end
