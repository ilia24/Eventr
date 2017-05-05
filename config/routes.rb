Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'events#index'

resources :events do
  resources :groups, only: %i(show create destroy)
  resources :reviews, only: %i(show create destroy)
end

resources :hosts, only: %i(new create show destroy)
resources :users, only: %i(new create)
resources :sessions, only: %i(new create destroy)

end
