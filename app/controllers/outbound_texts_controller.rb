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
            # text: "Your Shopping List: " +  body.join(" ")
        )

        debugger 

        render json: "Text sent"

    end



  private


  # Sends an SMS  (alternate method, I don't think i want to use.)



#   class Sms < ApplicationRecord
#     validates :to, presence: true
#     validates :from, presence: true
#     validates :text, presence: true
#   end



#   def create
#     # Create a SMS record to be stored in the database
#     @sms = Sms.new(to: 16096824839, from: FROM_NUMBER, text:"test!! Monday")
#     # @sms = Sms.new(safe_params)

#     if @sms.save
#       deliver @sms
#       redirect_to :outbound_sms, notice: 'SMS Sent'
#     else
#       flash[:alert] = 'Something went wrong'
#       render :index
#     end
#   end


      # Shows the UI for sending an SMS
#   def index
#     @sms = Sms.new
#   end


  # Initializes the Nexmo API client
  def nexmo
    # We do not pass in any API key or secret as
    # we're using environment variables `NEXMO_API_KEY`
    # and `NEXMO_API_SECRET`
    client = Nexmo::Client.new
  end

  # Determines the params that can be
  # stored in the database safely
  def safe_params
    params.require(:sms).permit(:to, :from, :text)
  end

  # Uses the Nexmo API to send the stored
  # SMS message
  def deliver sms
    response = nexmo.send_message(
      from: sms.from,
      to: sms.to,
      text: sms.text
    )

    # If sending the SMS was a success then store
    # the message ID on the SMS record
    if response['messages'].first['status'] == '0'
      sms.update_attributes(
        message_id: response['messages'].first['message-id']
      )
    end
  end

end