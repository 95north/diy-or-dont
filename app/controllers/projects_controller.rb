class ProjectsController < ApplicationController
    require 'jwt'

    attr_accessor :name, :id, :overview, :description, :image

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