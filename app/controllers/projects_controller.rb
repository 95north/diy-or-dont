class ProjectsController < ApplicationController
    require 'jwt'

    attr_accessor :name, :id, :overview, :description, :image

end