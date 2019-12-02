Rails.application.routes.draw do
  get 'event/stripe_callback'

  get 'event/payment_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '' => "users#root"
  get 'users/new' => "users#new"
  post 'users' => "users#create"

  get 'sessions/new' => "sessions#new"
  post 'sessions' => "sessions#create"

  get 'orders' => "orders#index"
  post 'orders' => "orders#checkout"
  get 'orders/success' => "orders#success"
  get 'orders/:id' => "orders#show"

  get 'courier/index' => "courrier#index"
  get 'courier/orders/:id/claim' => "courrier#claim"
  get 'courier/orders/:id' => "courrier#order"
  get 'courier/orders/:id/update' => "courrier#update"
  get 'courier/logoff' => "courrier#logoff"
  get 'courier/login' => "courrier#login"

end
