Rails.application.routes.draw do
	resources :artists, :songs
	get '/genres', to: 'songs#genre_index'
  get '/', to: 'songs#index'
end
