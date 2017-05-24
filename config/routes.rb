Rails.application.routes.draw do

mount ActionCable.server => '/cable'
# root 'conversations#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'home#index'

resources :events do
  resources :groups, only: %i(new show create destroy)
  resources :reviews, only: %i(show create destroy)
end



get '/events/:event_id/groups/:id/request', to: 'groups#grouprequest', as: 'request_to_join_group'
delete '/events/:event_id/groups/:id/request', to: 'groups#deleterequest', as: 'delete_request_to_join_group'

get '/events/:event_id/groups/:id/request/:request_id', to: 'groups#acceptrequest', as: 'accept_request'
delete '/events/:event_id/groups/:id/request/:request_id', to: 'groups#rejectrequest', as: 'reject_request'



get '/events/:event_id/groups/:id/join', to: 'groups#join', as: 'join_group'
get '/events/:event_id/groups/:id/leave', to: 'groups#leave', as: 'leave_group'


get '/events/:event_id/join', to: 'events#join', as: 'join_event'
get '/events/:event_id/leave', to: 'events#leave', as: 'leave_event'

resources :users, only: %i(index show new create) do
  resources :hostinfos, only: %i(new create edit update destroy)
  resources :eventrinfos, only: %i(new create edit update destroy)
  get '/conversations/new', to: 'conversations#new', as: 'new_conversation'
  get '/conversation', to: 'conversations#show', as: 'show_conversation'
end
resources :sessions, only: %i(new create destroy)




end
