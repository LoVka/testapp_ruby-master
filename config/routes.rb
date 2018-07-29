Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, except: [:new, :create]
  resources :editorial_lists
  resources :posts
  resources :categories

  get '/rss/latest.xml', to: 'rss#latest', defaults: {format: 'xml'}, as: 'rss_latest'
  get '/rss/category/:slug.xml', to: 'rss#category', defaults: {format: 'xml'}, as: 'rss_category'
  get '/rss/editorial/:slug.xml', to: 'rss#editorial', defaults: {format: 'xml'}, as: 'rss_list'

  get '/:category/:id', to: 'home#post', as: 'home_post'
  get '/:category/', to: 'home#category'
end
