require 'rubygems'
require 'net/http'
require 'json'

crop_data = [
  ["Wheat", 1010, "Vegetarian", '02A10145'],
  #["Maize (grain)", 576, "Vegetarian"],
  ["Rice (white)", 2385, "Vegetarian", '02A10174'],
  #["Grapes", 360, "Vegetarian", '06D10197'],
  ["Beef", 50000, "Omnivore", '08A10412'],
  ["Soy beans", 2200, "Vegetarian", '13A20068'] # Upper bound of 1650 - 2200
].sort_by {|x| x[1] }.collect {|x|
  url = '/foods/' + x[3] + '.json'
  res = Net::HTTP.start('ausnom.com', 80) {|http|
    http.get(url)
  }
  x + [JSON.parse(res.body)["nutrients"].detect{|x| x['nutrient_id'] == "ENERGY-04DF"}["value"]]
}

require 'pp'
pp crop_data
