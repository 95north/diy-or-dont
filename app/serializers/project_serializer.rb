class ProjectSerializer < ActiveModel::Serializer
    has_many :project_supplies
    has_many :supplies, through: :project_supplies
    has_many :user_projects
    has_many :users, through: :user_projects
    
    attributes :name, :id, :overview, :description, :image


end
