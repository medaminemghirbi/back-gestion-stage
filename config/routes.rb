Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :confirm_email] do
    member do
      get :confirm_email
    end
  end
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  get :employees, to: 'admin#getallemployees' 
  delete 'deleteemployee/:user_id', to: 'admin#deleteemployee' 
  patch '/updateadmin/:id', to: 'admin#updateadmin'
  patch '/updateemployeebyadmin/:id', to: 'admin#updateemployeebyadmin'
  patch '/updateadminimage/:id', to: 'admin#updateimageadmin'
  get :countall, to: 'admin#countall' 
  resources :motifs, only: %i[create index show update destroy]
  resources :demandes, only: %i[create index show update destroy]

  get 'getdemandebyemployee/:user_id', to: 'demandes#getdemandebyemployee'
  patch '/updatedays/:id', to: 'demandes#updatedays'
end
