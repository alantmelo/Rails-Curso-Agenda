Rails.application.routes.draw do
  get 'home/index'
  # get 'home' => 'home#index'
  root 'home#index'
  resources :phones
  resources :addresses
  resources :contacts
  resources :kinds# , except:[:edit]#, only:[:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
