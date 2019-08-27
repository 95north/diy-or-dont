class AuthController < ApplicationController
    require 'jwt'
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user, raise: false
    
    def retrieve
        token = request.headers["Authorization"]
        user_id = JWT.decode(token, "secret")[0]["user_id"]
        user = User.find(user_id)
        # debugger
        render json: {user: user.username}
    end

    def authenticate
        #username = JWT.decode(token, "secret")[0]["username"]
        user = User.find_by(username: user_params["username"])
        # I never check password!   Password should come in as JWT though.. no? 
        #if user_params["password"] === user.password
        if user.password_digest   # I never check password! 
            secret = 'secret'
            token = JWT.encode(user, secret, 'HS256')
            render json: {
                token: token    # Does return a token! 
            }
        else
            render json: {
                message: "Incorrect creds"
            }
        end

    end


  
    def destroy
    end


    private
  
    def user_params
      params.require(:user).permit(:username, 
                                      :password,
                                      :location)
    end


  end