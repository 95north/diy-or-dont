class UserProjectSerializer # < ActiveModel::Serializer
    # The attribute names are a whitelist of attributes to be serialized.
    include FastJsonapi::ObjectSerializer

    attributes :id, :project_id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText
    belongs_to :user
    belongs_to :project





    # BELOW - for gem = Active Model Serializers
    # belongs_to :user
    # belongs_to :project

    # # attributes :id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText, :user_info, :project_info

    # attributes :id, :user_info, :project_info


    # def user_info

    #     self.object.users.map do |user|
    #         {user_name: user.name,
    #         user_location: user.location,
    #         }
    #         # {user_name: self.object.user.name,
    #         # user_location: self.object.user.location,
    #         # }
    #     end
    # end


    # def project_info
    #     debugger
    #     self.object.projects.map do |project|
    #         {project_id: project.id,
    #         project_overview: project.overview,
    #         project_description: project.description,
    #         project_image: project.image
    #         }
    #         # {project_id: self.object.project.id,
    #         # project_overview: self.object.project.overview,
    #         # project_description: self.object.project.description,
    #         # project_image: self.object.project.image
    #         # }
    #     end
    # end

    # #return [:project_info, :user_info, :id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText]
    # # return self.id #  Invalid return in class/module body

    # def return_func    DOESNT DO WHAT I WAS HOPING.
    #     [:id, :status, :usernote, :reviewDifficulty, :reviewFun, :reviewTime, :reviewText, :project_info, :user_info]
    # end

end
