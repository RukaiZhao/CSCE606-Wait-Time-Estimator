Rails.application.routes.draw do
  resources :patients
  
  root "patients#new"

  get '/staff' , to: 'patients#staff'
  get '/button', to: 'patients#button', as: 'button'
  get '/admin_view', to: 'patients#admin_view'
  
  post '/patients/1', to: 'patients#update'
  
  post '/admin_log_in', to: 'patients#admin_log_in'
  post '/patients', to: 'patients#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
