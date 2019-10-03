class UserSuppliesController < ApplicationController

    def add_to_shopping_list
        us = UserSupply.new
        us.user_id = params["userId"]
        us.supply_id= params["supplyId"]
        us.userneeds= true #params["userneeds"]
        us.project_name = params["project_name"]

        project_id = params["project_id"]
        projectSupplyItem = ProjectSupply.select{ |ps|  
        ps.supply_id === us.supply_id &&  ps.project_id  === project_id 
        }

        us.quantity = projectSupplyItem[0].quantity
        us.measurement = projectSupplyItem[0].note


        us.save
        render json: us
    end

    def add_to_my_toolbox
        us = UserSupply.new
        us.user_id = params["userId"]
        us.supply_id= params["supplyId"]
        us.intoolbox= true # params["intoolbox"]
        us.project_name = params["project_name"]

        project_id = params["project_id"]
        projectSupplyItem = ProjectSupply.select{ |ps|  
        ps.supply_id === us.supply_id &&  ps.project_id  === project_id 
        }

        us.quantity = projectSupplyItem[0].quantity
        us.measurement = projectSupplyItem[0].note

        us.save
        render json: us
    end

    def move_from_shopping_list_to_toolbox
        us = UserSupply.find(params["id"])
        us.userneeds = false
        us.intoolbox = true
        us.save
        render  json: us
    end

    def delete 
        us = UserSupply.find(params["id"])
        us.delete
        render json: "OK"
    end


end
