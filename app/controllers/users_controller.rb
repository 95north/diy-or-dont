class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user, raise: false
    # prevent errors from showing w raise: false  - lets you opt out of the new behavior.
    # skip_before_action :authenticate_user, only: [:create], raise: false

    # The actual before_action that is used to verify the CSRF token. 
    # Don't override this directly. Provide your own forgery protection 
    # strategy instead. If you override, you'll disable same-origin 
    # <script> verification.

    # ^ Lean on the protect_from_forgery declaration to mark which actions are 
    # due for same-origin request verification. If protect_from_forgery is 
    # enabled on an action, this before_action flags its after_action to 
    # verify that JavaScript responses are for XHR requests, ensuring they 
    # follow the browser's same-origin policy.


    def index
        # debugger
        @users= User.all 
    end
  
    def new
        # debugger
        @user = User.new
    end
  
    def create
        # debugger  #
        @user = User.create(user_params)
        token = JWT.encode({user_id: user.id}, "secret")
        render json: {token: token, user: user.username }
        # @user = User.new(user_params)
        # if @user.save

        #   redirect_to :action => 'index'
        # else
        #   render :action => 'new'
        # end

        if @user.save
            response = { message: 'User created successfully'}
            render json: response, status: :created 
           else
            render json: @user.errors, status: :bad
           end 
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