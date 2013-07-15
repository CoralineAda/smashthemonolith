Smashthemonolith::Application.routes.draw do

  root :to => 'subscriptions#index'

  resources :subscriptions, :only => [:index, :create]

end
