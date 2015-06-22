Rails.application.routes.draw do
  resources :outstanding_transactions do
    member do
      put :settle_outstanding
    end
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end
  devise_for :users, controllers: { sessions: "sessions" }

  resources :transactions

  resources :categories
end
