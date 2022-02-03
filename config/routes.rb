Rails.application.routes.draw do
  #get 'faculties/index'
  #get 'faculties/new'
  #get 'faculties/create'
  #get 'faculties/show'
  #get 'faculties/edit'
  #get 'faculties/update'
  #get 'faculties/destroy'
  #get 'students/index'
  #get 'students/new'
  #get 'students/create'
  #get 'students/show'
  #get 'students/edit'
  #get 'students/update'
  #get 'students/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "faculties#index"
  
  resources :faculties
  resources :students
  # Defines the root path route ("/")
  # root "articles#index"
end
