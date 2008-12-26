require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
  erb :cost
end

get '/environment' do
  erb :environment
end
