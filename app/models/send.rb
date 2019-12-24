require 'dotenv/load'
require 'nexmo'

Send = "Nothing sent"


# NEXMO_API_KEY = ENV['NEXMO_API_KEY']
# NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
# TO_NUMBER = ENV['TO_NUMBER']

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

# client.sms.send(
#   from: 'Acme Inc',
#   to: TO_NUMBER,
#   text: 'A text message sent using the Nexmo SMS API'
# )