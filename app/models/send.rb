require 'dotenv/load'
require 'nexmo'

Send = "Nothing sent"  #to make Heroku happy

if !defined?(NEXMO_API_KEY)
  NEXMO_API_KEY = ENV['NEXMO_API_KEY']
end

if !defined?(NEXMO_API_SECRET)
  NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
end 

if !defined?(TO_NUMBER) 
  TO_NUMBER = ENV['TO_NUMBER']
end

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

