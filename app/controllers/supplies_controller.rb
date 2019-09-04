

class SuppliesController < ApplicationController    
    # attr_accessor :name, :id, :overview, :description, :image
    
    def index 
        all_projects = Supply.all
        render json: all_projects
    end

    def create 
        s = Supply.new
        debugger
        s.name = params["name"]
        s.description = params["description"]
    end



end