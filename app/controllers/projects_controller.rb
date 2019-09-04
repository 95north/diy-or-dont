class ProjectsController < ApplicationController
    require 'jwt'

    attr_accessor :name, :id, :overview, :description, :image


    def create
        new_project = Project.new
        new_project["name"] = params["newProjectName"]
        new_project["overview"] = params["newProjectOverview"]
        new_project["description"] = params["newProjectDescription"]
        # new_project["image"] = params
        new_project.save 
        project_id = new_project.id 
        
        params["tools"].each { |tool|
            if (tool["NewProjToolNewToolName"] != "")
                # Create new tool
                s = Supply.new
                s.name = tool["NewProjToolNewToolName"]
                s.description =  tool["NewProjToolNewToolDescription"]
                s.save
                
                # Create new Project - Tool join record
                ps = ProjectSupply.new
                ps["quantity"] = tool["quantity"]
                ps["note"] = tool["note"]
                ps["mandatory"] = tool["mandatory"]
                ps["supply_id"] = s.id
                ps["project_id"] = project_id
                ps.save
            end
        }



        params["tools"].each { |proj_tool|
            
            if (proj_tool["NewProjToolNewToolName"] === '')
                ps = ProjectSupply.new
                end_index = proj_tool["name"].length

                ps["quantity"] = proj_tool["quantity"]
                ps["note"] = proj_tool["note"]
                ps["mandatory"] = proj_tool["mandatory"]
                ps["supply_id"] = proj_tool["name"].slice!(6..end_index)
                ps["project_id"] = project_id

                ps.save
            end
        }

        output= []
        output.push([new_project, new_project.user_projects, new_project.supplies, new_project.project_supplies])
        render json: output
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