PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:create, :show, :edit, :update]
  resources :categories, except: [:delete, :edit, :update]
end
