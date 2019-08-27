class ProjectSerializer #< ActiveModel::Serializer

    include FastJsonapi::ObjectSerializer

    attributes :name, :id, :overview, :description, :image
    has_many :project_supplies
    has_many :user_projects

    
    # BELOW - for gem = Active Model Serializers
    # has_many :project_supplies
    # has_many :supplies, through: :project_supplies
    # has_many :user_projects
    # has_many :users, through: :user_projects
    
    # attributes :name, :id, :overview, :description, :image


end
