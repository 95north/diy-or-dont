Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/signup', to: 'users#create'

  get '/retrieve_user', to: 'auth#retrieve'
  post '/login', to: 'auth#authenticate'

      # User_Projects  (Reviews)
  get '/projects/:id', to: 'user_projects#one_user_projects'  # For My Projects display. 
  post '/newuserproject', to: 'user_projects#create'
  get '/reviews/:id', to: 'user_projects#get_reviews'   # All reviews for one project
  get '/review/:id', to: 'user_projects#show'   # One user's review for one project.
  patch '/review/:id', to: 'user_projects#update' # New / Edit Review


      # Projects
  get '/allprojects', to: 'projects#all_projects_and_their_tools_and_reviews' #For All Projects display
  post '/', to: 'projects#create'  # URL to post from ?? 

      # Supplies
  get '/supplies', to: 'supplies#index' #For NewProjectForm Container



end
