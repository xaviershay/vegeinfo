require 'rubygems'
require 'sinatra'
require 'json'

module BonusArrayMethods
  def collect_with_index
    ret = []
    each_with_index do |item, index|
      ret << yield(item, index)
    end
    ret
  end

  def inject_with_index(injected)
    each_with_index{ |obj, index| injected = yield(injected, obj, index) }
    injected
  end
end

get '/' do
  erb :home
end

get '/cost' do
  erb :cost
end

get '/environment' do
  erb :environment
end

get '/health' do
  erb :health
end
