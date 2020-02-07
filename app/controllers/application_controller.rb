class ApplicationController < ActionController::API
    # include ActionController::Serialization
    # protect_from_forgery with: :exception
    # protect_from_forgery unless: -> { request.format.json? }
    # Forgery protection is applied by default as of 5.2.

    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, "secret")
    end

    def auth_header
        request.headers["Authorization"]
    end

    def decoded_token
        if auth_header ########
            token = auth_header
            begin
                JWT.decode(token, "secret", true)
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]["user_id"]         
            user = User.find(user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: "Not logged in!"}, status: :unauthorized unless logged_in?
    end

end
