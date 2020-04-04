Rails.application.routes.draw do
  get 'home/about'
  root 'books#top'
  devise_for :users
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resource :comments, only:[:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'users/:id/following' => 'users#following', as: 'following'
  get 'users/:id/followed' => "users#followed", as: 'followed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
