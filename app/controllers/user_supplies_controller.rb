class UserSuppliesController < ApplicationController

    def add_to_shopping_list
        us = UserSupply.new
        us.user_id = params["userId"]
        us.supply_id= params["supplyId"]
        us.userneeds= true #params["userneeds"]
        us.save

        render json: us
    end



    def add_to_my_toolbox
        us = UserSupply.new
        us.user_id = params["userId"]
        us.supply_id= params["supplyId"]
        us.intoolbox= true # params["intoolbox"]
        us.save
        # debugger
        render json: us
    end


end
