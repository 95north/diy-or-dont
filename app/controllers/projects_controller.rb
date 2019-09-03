class ProjectsController < ApplicationController
    require 'jwt'

    attr_accessor :name, :id, :overview, :description, :image


    def create
        new_project = Project.new
        new_project["name"] = params
        new_project["overview"] = params
        new_project["description"] = params
        new_project["image"] = params
        new_project.save 
        render json: new_project
    end

    

    def all_projects_and_their_tools_and_reviews
        @projects = Project.all
        output = []

        @projects.each do |proj|
            output.push([proj, proj.user_projects, proj.supplies, proj.project_supplies])


            # p = Project.find( uproj.project_id )
            # output.push([user.username, user.location, uproj, p])
            # debugger
        end   
        render json: output        
    end
  



end