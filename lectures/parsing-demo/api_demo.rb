require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
puts "Who do you want to look for?"
nickname = gets.chomp

url = "https://api.github.com/users/#{nickname}"
user_serialized = URI.open(url).read

user = JSON.parse(user_serialized)
puts "#{user["name"]} - #{user["bio"]}"
