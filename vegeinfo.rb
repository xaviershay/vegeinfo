require 'rubygems'
require 'sinatra'
require 'json'

class Array
  def collect_with_index
    ret = []
    each_with_index do |item, index|
      ret << yield(item, index)
    end
    ret
  end
end

get '/' do
  erb :cost
end

get '/environment' do
  erb :environment
end
