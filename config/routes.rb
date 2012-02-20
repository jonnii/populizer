Populizer::Application.routes.draw do

  devise_for :users

  resources :names

  root :to => 'welcome#index'
end