class UserProjectsController < ApplicationController
    # gem = Active Model Serializers
    attr_accessor :id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText
    
    def show
        review_id = params["id"].to_i
        review = UserProject.find(review_id)
        # debugger
        render json: review
    end


    def create
        new_user_project = UserProject.new
        new_user_project.user_id = params["user_id"]
        new_user_project.project_id = params["project_id"]
        new_user_project.save 
        render json: new_user_project
    end


    def update
        params
        review_id_to_update = params["id"].to_i
        up = UserProject.find(review_id_to_update)
        up.status =  params["status"]
        up.reviewDifficulty = params["reviewDifficulty"]
        up.reviewFun = params["reviewFun"]
        up.reviewTime = params["reviewTime"]
        up.reviewText = params["reviewText"]
        if params["usernote"] 
            up.userNote = params["userNote"]
        end

        up.save

        render json: up
    end


    def delete 
        up = UserProject.find(params["id"])
        up.delete
        render json: params["id"] + "  Delete  "
    end


    def one_user_projects
        # Output structure desired: 
        # userProjects: [  [(user_proj/“reviews”,  proj,  proj_supplies], … ]
        # userSupplies: [ user_supplyObj  + name:Supply.name,   … ] 
        user = User.find(params["id"])
        @ups = user.user_projects  
           
        userSupplies= [user.user_supplies, user.supplies]
        output = []

        @ups.each do |uproj|
            p = Project.find( uproj.project_id )
            output.push([user.username, user.location, uproj, p, p.supplies])
        end   

        output.push(userSupplies)
        # debugger  Tested- Steph doesn't have user supplies.  Tori does. 
        render json: output        
    end


    def get_reviews
        proj_id = params["id"].to_i

        reviews = UserProject.select {|proj| proj.project_id == proj_id }
         # Try refactoring to use find_each again?  Does Select copy all records from DB? 
            # https://guides.rubyonrails.org/v2.3.11/active_record_querying.html

        reviews_and_users = []

        if (reviews.length > 0 )
            reviews.each do |review|
                u = User.find(review.user_id)
                # return([review, u])
                reviews_and_users.push([review, u])
            end
        end
        
        #debugger  #-- reviews_and_users has data here!! 
        render json: reviews_and_users
    end




    # def one_user_projects  --- trying out Active Record Serializer ...
    #     user = User.find(params["id"])

    #     #render json: {projects: user_projects}
    #     # render json: user, root: false  #NOPE 
    #     #render json: user, user_project_serializer: UserProjectSerializer  # Just renders user!
    #     # render json: {user_project_serializer: UserProjectSerializer}  # Just renders user!
    #     # render json: user, serializer: UserProjectSerializer, root: user_project  # Just renders user!
    #     # FAST JSON API 1 -- hash = UserProjectSerializer.new(user).serializable_hash

    #     # FAST JSON API 2 - works, but ugly
    #     # user_projects_array=[user]
    #     @ups = user.user_projects   # Works! 
    #     # @ups.each do |uproj| 
    #     #     u = UserProjectSerializer.new(uproj).serializable_hash
    #     #     p = Project.find( u[:data][:attributes][:project_id] )
    #     #     debugger
    #     #         u["proj"]= p
    #     #         user_projects_array.push(u)
                
    #     #     # debugger
    #     # end
    #     output = []

    #     @ups.each do |uproj|
    #         p = Project.find( uproj.project_id )
    #         output.push([user.username, user.location, uproj, p])
    #         # debugger
    #     end   
    #     # render json: user_projects_array
    #     # render json:{user_project: @ups, user: @ups.user, project: @ups.project}  there are SEVERAL UserProjects! This works for one! 
    #     render json: output
        
    # end
  






  
#   private
  
#       def user_params
#         params.require(:user).permit(:id)
#       end


end