Populizer::Application.routes.draw do

  devise_for :users

  resources :names do
    collection do
      get :random
    end
  end

  resources :first_names do
    collection do
      get :random
    end
  end

  resources :last_names do
    collection do
      get :random
    end
  end

  resources :builders

  root :to => 'welcome#index'
end