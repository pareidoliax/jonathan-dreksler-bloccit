Bloccit::Application.routes.draw do

  devise_for :users
  resources :users
    
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  get 'about', to: 'welcome#about'

  root to: 'welcome#index'
end

