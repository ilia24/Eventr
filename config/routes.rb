Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'events#index'

resources :events do
  resources :groups, only: %i(new show create destroy)
  resources :reviews, only: %i(show create destroy)
end


resources :users, only: %i(show new create) do
  resources :hostinfos, only: %i(new create edit update destroy)
  resources :eventrinfos, only: %i(new create edit update destroy)
end
resources :sessions, only: %i(new create destroy)

end
