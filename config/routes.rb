Rails.application.routes.draw do

  get 'sessions/new'

  root to: 'blogs#index'
  # root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]

  resources:blogs do
    collection do
      post :confirm
    end
  end

  def new
  end

end
