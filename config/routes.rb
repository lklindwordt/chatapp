Rails.application.routes.draw do
  root to: 'rooms#show'
  get 'rooms/show'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
