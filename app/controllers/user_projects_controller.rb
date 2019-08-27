class UserProjectsController < ApplicationController
    # gem = Active Model Serializers
    attr_accessor :id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText

    def one_user_projects
        user = User.find(params["id"])
        user_projects_array=[user]
        # user.projects
        @ups = user.user_projects   # Works! 
        #user_projects = user.projects
        #render json: {projects: user_projects}
        # render json: user, root: false  #NOPE 
        #render json: user, user_project_serializer: UserProjectSerializer  # Just renders user!
        # render json: {user_project_serializer: UserProjectSerializer}  # Just renders user!
        # render json: user, serializer: UserProjectSerializer, root: user_project  # Just renders user!
        # FAST JSON API 1 -- hash = UserProjectSerializer.new(user).serializable_hash
        @ups.each do |uproj| 
            u = UserProjectSerializer.new(uproj).serializable_hash
            p = Project.find( u[:data][:attributes][:project_id] )
            debugger
                u["proj"]= p
                user_projects_array.push(u)
                
            # debugger
        end

        render json: user_projects_array
    end
  


  
#   private
  
#       def user_params
#         params.require(:user).permit(:id)
#       end


end