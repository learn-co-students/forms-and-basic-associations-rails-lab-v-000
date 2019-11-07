Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, :songs, only: [:index, :new, :create, :show, :edit, :update]
end
