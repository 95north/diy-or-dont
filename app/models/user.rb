class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    has_many :user_supplies
    has_many :supplies, through: :user_supplies
    has_many :user_projects
    has_many :projects, through: :user_projects
end
