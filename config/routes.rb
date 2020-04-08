Rails.application.routes.draw do

  get 'chat/show'
  get 'home/about'
  root 'books#top'
  devise_for :users

  resources :books do
    resource :favorites, only:[:create, :destroy]
    resource :comments, only:[:create, :destroy]
    get 'search', on: :collection
  end

  resources :users, only: [:show, :index, :edit, :update] do
    get 'search', on: :collection
  end

  resources :rooms, only:[:show, :create]
  get 'rooms/:id' => 'chat#show'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  get 'users/:id/following' => 'users#following', as: 'following'#フォロー見る
  get 'users/:id/followed' => "users#followed", as: 'followed'#フォロワー見る
  get 'search' => "search#search"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
