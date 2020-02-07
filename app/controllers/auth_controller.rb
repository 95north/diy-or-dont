class AuthController < ApplicationController
    require 'jwt'
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user, raise: false
    skip_before_action :authorized, only: [:authenticate]

    def authenticate  #returning user login
        user = User.find_by(username: user_params["username"])
        debugger
        if user && user.authenticate(user_params[:password])
            token = encode_token({user_id: user.id})
            render json: {
                user_id: user.id,
                user_name: user.username,
                user_location: user.location,
                token: token,
                status: :accepted
            } 
        else
            render json: {
                message: "Bad username or password", 
                status: :unauthorized
            }
        end
    end

    def retrieve  # || User/profile
        render json: {user: UserSerializer.new(current_user), status: :accepted}
    end


    
    def toriRetrieve    #  used in App.js componentDidMount
        token = request.headers["Authorization"]
        user_id = JWT.decode(token, "secret")[0]["user_id"]
        user = User.find(user_id)
        # debugger
        render json: {user: user.username}
    end

    def toriAuthenticate  #my Login function 
        token = request.headers["Authorization"]  # "nil token error"
        #username = JWT.decode(token, "secret")[0]["username"]
        user = User.find_by(username: user_params["username"])
        pw = JWT.decode(token, "secret")[0]["password"]
        # pw = JWT.decode(user.password_digest, "secret")
        # debugger  When I log in as Ben, it does find Ben in the backend (by username)
        # I never check password!   Password should come in as JWT though.. no? 
        #if user_params["password"] === user.password
        if user.password_digest   # I never check password! 
            secret = 'secret'
            token = JWT.encode(user, secret, 'HS256')
            render json: {
                token: token,    # Does return a token! 
                user_id: user.id,
                user_name: user.username,
                user_location: user.location
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