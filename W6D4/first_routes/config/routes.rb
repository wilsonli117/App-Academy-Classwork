Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users 

  # get '/users', to: 'users#index', as: 'users'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/:id', to: 'users#show', as: 'user'
  # patch '/users/:id', to: 'users#update' 
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  # resources :users do 
  #     resources :artworks, only: :index
  # end

  get '/users/:id/artworks', to: 'artworks#index'
  get '/users/:id/likes', to: 'likes#user_index'
  get '/comments/:id/likes', to: 'likes#type_index'
  get '/artworks/:id/likes', to: 'likes#type_index'
  get '/users/:id/collection', to: 'users#collection'
  post '/users/:id/collection', to: 'collections#create'
  delete '/users/:id/collection', to: 'collections#destroy'
  patch '/users/:id/collection', to: 'collections#update'

  # post '/comments', to: 'comments#create'
  # get  '/comments', to: 'comments#index'
  # delete '/comments/:id', to: 'comments#destroy'
 

  resources :comments, only: [:create, :index, :destroy]
  resources :likes, only: [:create, :destroy]

  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]


end

# NewspapersApp::Application.routes.draw do
#   resources :magazines do
#     # provides a route to get all the articles for a given magazine.
#     resources :articles, only: :index
#   end

#   # provides all seven typical routes
#   resources :articles
# end