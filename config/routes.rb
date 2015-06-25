Rails.application.routes.draw do
  resources :outstanding_transactions do
    member do
      get :settle_outstanding
    end
  end

  devise_scope :user do
    root 'home#check'
  end
  devise_for :users, controllers: {sessions: "sessions"}

  resources :transactions
  resources :first_time, :only => :index do
    collection do
      post :create_user
    end
  end
  resources :categories
end
