class UserSerializer #< ActiveModel::Serializer


    include FastJsonapi::ObjectSerializer

    attributes :username, :location
    has_many :user_supplies
    has_many :user_projects

    
    # BELOW - for gem = Active Model Serializers
    # has_many :user_supplies
    # has_many :supplies, through: :user_supplies
    # has_many :user_projects
    # has_many :projects, through: :user_projects

    # attributes :username, :location

end