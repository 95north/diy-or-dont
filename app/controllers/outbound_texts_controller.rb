class OutboundTextsController < ApplicationController
    require 'dotenv/load'
    require 'nexmo'

    # Below- don't need for Heroku, are in Heroku 
    if !defined?(NEXMO_API_KEY)
      NEXMO_API_KEY = ENV['NEXMO_API_KEY']
    end

    if !defined?(NEXMO_API_SECRET)
      NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
    end 

    if !defined?(FROM_NUMBER) 
      FROM_NUMBER = ENV['FROM_NUMBER']
    end





    def create
        client = Nexmo::Client.new(
            api_key: NEXMO_API_KEY,
            api_secret: NEXMO_API_SECRET
        )  

        m = params

        recipient = params["to"].to_i

        body = "Your Shopping List:"
        m["text"].each_with_index { |item, index|
            count = if !item[2]     
                    count = "1"
                else
                    count = "#{item[2]}" 
                end
            body = body + " ##{index + 1}. #{count}ct.  #{item[0]}; #{item[1]}. #{item[4]}, #{item[5]}"
        }

        debugger

        response = client.sms.send(
            from: FROM_NUMBER,
            to: recipient,
            text: body
        )

        debugger 

        render json: "Text sent"

    end




  private


  # Initializes the Nexmo API client
  def nexmo
    # using environment variables,  so no API key
    client = Nexmo::Client.new
  end

  # Determines params that can be stored in db safely
  def safe_params
    params.require(:sms).permit(:to, :from, :text)
  end

  # Uses the Nexmo API to send the stored message
  def deliver sms
    response = nexmo.send_message(
      from: sms.from,
      to: sms.to,
      text: sms.text
    )

    # If sending was a success, then store message ID on SMS record
    if response['messages'].first['status'] == '0'
      sms.update_attributes(
        message_id: response['messages'].first['message-id']
      )
    end
  end

end