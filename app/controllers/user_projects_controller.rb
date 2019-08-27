class UserProjectsController < ApplicationController
    # gem = Active Model Serializers
    attr_accessor :id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText

    def one_user_projects
        user = User.find(params["id"])


        #render json: {projects: user_projects}
        # render json: user, root: false  #NOPE 
        #render json: user, user_project_serializer: UserProjectSerializer  # Just renders user!
        # render json: {user_project_serializer: UserProjectSerializer}  # Just renders user!
        # render json: user, serializer: UserProjectSerializer, root: user_project  # Just renders user!
        # FAST JSON API 1 -- hash = UserProjectSerializer.new(user).serializable_hash

        # FAST JSON API 2 - works, but ugly
        # user_projects_array=[user]
        @ups = user.user_projects   # Works! 
        # @ups.each do |uproj| 
        #     u = UserProjectSerializer.new(uproj).serializable_hash
        #     p = Project.find( u[:data][:attributes][:project_id] )
        #     debugger
        #         u["proj"]= p
        #         user_projects_array.push(u)
                
        #     # debugger
        # end
        output = []

        @ups.each do |uproj|
            p = Project.find( uproj.project_id )
            output.push([user.username, user.location, uproj, p])
            # debugger
        end   
        # render json: user_projects_array
        # render json:{user_project: @ups, user: @ups.user, project: @ups.project}  there are SEVERAL UserProjects! This works for one! 
        render json: output
        
    end
  


  
#   private
  
#       def user_params
#         params.require(:user).permit(:id)
#       end


end