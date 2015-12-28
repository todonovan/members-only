Rails.application.routes.draw do
  get 'posts/new'

  get 'sessions/new'

  root 'static_pages#home'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :index, :show]
end
