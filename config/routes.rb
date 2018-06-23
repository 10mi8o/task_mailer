Rails.application.routes.draw do

  # add 以下Task_mailerの為、追記
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/inbox"
  end

  get 'sessions/new'

  # root to: 'blogs#index'
  root to: 'users#new'



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
