Rails.application.routes.draw do

  resources :articles, path: 'news'

  resources :articles, path: 'news' do
    resources :comments
  end
end
