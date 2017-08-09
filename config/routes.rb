Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [:edit, :update, :destroy]
end
