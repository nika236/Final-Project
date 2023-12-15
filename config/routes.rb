Rails.application.routes.draw do
  resources :subjects do
    resources :lecturers, shallow: true, except: [:index] do
      resources :bookings, except: [:index]
    end
  end

  resources :questionnaires
  devise_for :users
  root 'pages#home'
  resources :reports, only: [:index]

  get '/about', to: 'pages#about'

  resources :reports, only: [:index] do
    get :booking_report, on: :collection
  end
end
