Rails.application.routes.draw do
  get '/sign-in', to: 'users#sign_in_page'
  post '/sign-in', to: 'users#sign_in'
  patch '/sign-in', to: 'users#sign_in'
  resources :users, only: %i[new create show]  
  resources :events, only: %i[new create show index] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
