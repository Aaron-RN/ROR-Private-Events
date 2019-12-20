Rails.application.routes.draw do
  root 'events#index'
  get '/sign-in', to: 'users#sign_in_page'
  post '/sign-in', to: 'users#sign_in'
  get '/sign_out', to: 'users#sign_out'
  
  resources :users, only: %i[new create show]  
  resources :events, only: %i[new create show index] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
