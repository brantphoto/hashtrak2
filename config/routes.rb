Hashtrek::Application.routes.draw do

  resources :categories
  resources :searches, defaults: {format: :json }
  resources :hashtag_feeds, only: [:index, :show, :create, :update] do
    resources :hash_sizes, only: [:index, :show], defaults: { format: :json }
  end

  root 'hashtag_feeds#index'
end
