Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show]

    resource :phones, only: [:show]

    resource :phone, only: [:update, :create, :destroy]

    resource :address, only: [:show, :update, :create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
