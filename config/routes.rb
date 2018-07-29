Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users
  resources :editorial_lists
  resources :posts
  resources :categories

  post 'editorial_lists/add', to: 'editorial_lists#add'

  get '/rss/latest.xml', to: 'rss#latest'
  get '/rss/category/:slug.xml', to: 'rss#category'
  get '/rss/editorial/:slug.xml', to: 'rss#editorial'

  get '/:category/:id', to: 'home#post'
  get '/:category/', to: 'home#category'
end
