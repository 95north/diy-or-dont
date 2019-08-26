class Project < ApplicationRecord
    has_many :project_supplies
    has_many :supplies, through: :project_supplies
    has_many :user_projects
    has_many :users, through: :user_projects
end


