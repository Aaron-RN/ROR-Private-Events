Rails.application.routes.draw do
  get '/sign-in', to: 'users#sign_in'
  post '/sign-in', to: 'users#sign_in'
  patch '/sign-in', to: 'users#sign_in'
  resources :users, only: %i[new create show] do
    collection do
      
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
