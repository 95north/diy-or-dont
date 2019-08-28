Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/signup', to: 'users#create'
  get '/retrieve_user', to: 'auth#retrieve'
  post '/login', to: 'auth#authenticate'
  get '/projects/:id', to: 'user_projects#one_user_projects'
  get '/allprojects', to: 'projects#all_projects_and_their_tools_and_reviews'
  

end
