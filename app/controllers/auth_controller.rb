class AuthController < ApplicationController
    require 'jwt'
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user, raise: false
    skip_before_action :authorized, only: [:authenticate]

    def authenticate  #returning user login

        user = User.find_by(username: user_params["username"])
        puts "In Authenticate, user is:---------- "
        puts user
        if user && user.authenticate(user_params[:password])
            puts "Returning user login - user authenticated!"
            token = encode_token({user_id: user.id})
            puts "token is------------: "
            puts token
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


    def retrieve  
        render json: {user: UserSerializer.new(current_user), status: :accepted}
    end

    
    def toriRetrieve    #  used in App.js componentDidMount
        token = request.headers["Authorization"]
        user_id = JWT.decode(token, "secret")[0]["user_id"]
        user = User.find(user_id)
        # debugger
        render json: {user: user.username}
    end

    private
  
    def user_params
      params.require(:user).permit(:username, 
                                      :password,
                                      :location)
    end


  end