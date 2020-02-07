class UserProjectsController < ApplicationController
    # gem = Active Model Serializers
    attr_accessor :id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText
    
    def show
        review_id = params["id"].to_i
        review = UserProject.find(review_id)
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
        user = User.find(params["id"])
        @ups = user.user_projects  
           
        userSupplies= [user.user_supplies, user.supplies]
        output = []

        @ups.each do |uproj|
            p = Project.find( uproj.project_id )
            output.push([user.username, user.location, uproj, p, p.supplies])
        end   

        output.push(userSupplies)
        render json: output        
    end


    def get_reviews
        proj_id = params["id"].to_i

        reviews = UserProject.select {|proj| proj.project_id == proj_id }
        reviews_and_users = []

        if (reviews.length > 0 )
            reviews.each do |review|
                u = User.find(review.user_id)
                reviews_and_users.push([review, u])
            end
        end
        
        #debugger  #-- reviews_and_users has data here!! 
        render json: reviews_and_users
    end





  
#   private
  
#       def user_params
#         params.require(:user).permit(:id)
#       end


end