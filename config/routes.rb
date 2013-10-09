Blogger::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    post '/users/create', to: 'users/omniauth_callbacks#create'
  end

  resources :posts do
    get :image, on: :member
  end

  root 'posts#index'
end
