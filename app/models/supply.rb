class Supply < ApplicationRecord
    has_many :project_supplies
    has_many :projects, through: :project_supplies
    has_many :user_supplies
    has_many :users, through: :user_supplies
end
