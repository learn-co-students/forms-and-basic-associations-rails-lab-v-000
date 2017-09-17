Rails.application.routes.draw do
  resources :artists, :songs, :genres
  get '/', to: 'songs#index'
end
