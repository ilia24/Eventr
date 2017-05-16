Rails.application.routes.draw do

mount ActionCable.server => '/cable'
# root 'conversations#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'home#index'

resources :events do
  resources :groups, only: %i(new show create destroy) do
    resources :chat_rooms, only: [:index, :new, :create, :show]
  end
  resources :reviews, only: %i(show create destroy)
end

get '/events/:event_id/groups/:id/chat_room', to: 'chat_rooms#display', as: 'chat'
get '/events/:event_id/groups/:id/join', to: 'groups#join', as: 'join_group'
get '/events/:event_id/groups/:id/leave', to: 'groups#leave', as: 'leave_group'


get '/events/:event_id/join', to: 'events#join', as: 'join_event'
get '/events/:event_id/leave', to: 'events#leave', as: 'leave_event'

resources :users, only: %i(index show new create) do
  resources :hostinfos, only: %i(new create edit update destroy)
  resources :eventrinfos, only: %i(new create edit update destroy)
end
resources :sessions, only: %i(new create destroy)

resources :personal_messages, only: [:create, :new]
resources :conversations, only: [:index, :new, :show, :create]

end
