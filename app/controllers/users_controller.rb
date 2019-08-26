class UserController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @users= User.all 
    end
  
    def new
        @user = User.new
    end
  
    def create
        user = User.create(user_params)
        token = JWT.encode({user_id: user.id}, "secret")
        render json: {token: token, user: user.username }
        # @user = User.new(user_params)
        # if @user.save
        #   redirect_to :action => 'index'
        # else
        #   render :action => 'new'
        # end
    end
  
    def edit
    end
  
    def show
    end
  
  private
  
      def user_params
        params.require(:user).permit(:username, 
                                        :password,
                                        :location)
      end


end