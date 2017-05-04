Rails.application.routes.draw do

  get 'hosts/new'

  get 'hosts/create'

  get 'hosts/show'

  get 'hosts/destroy'

  get 'groups/show'

  get 'groups/create'

  get 'groups/destory'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'events#index'

resources :events do
  resources :reviews, only: %i(show create destroy)
end

resources :users, only: %i(new create)
resources :sessions, only: %i(new create destroy)

end
