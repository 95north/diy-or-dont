class UserProjectsController < ApplicationController
    # gem = Active Model Serializers
    
    def one_user_projects
        user = User.find(params["id"])
        #user_projects = user.projects
        #render json: {projects: user_projects}
        # render json: user, root: false  #NOPE 
        #render json: user, user_project_serializer: UserProjectSerializer  # Just renders user!
        # render json: {user_project_serializer: UserProjectSerializer}  # Just renders user!
        render json: user, serializer: UserProjectSerializer  # Just renders user!

        
    end
  


  
#   private
  
#       def user_params
#         params.require(:user).permit(:id)
#       end


end