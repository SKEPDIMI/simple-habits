Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'habits#index', as: 'habits_index'
  post '/habits/:id/complete', to: 'habits#complete'
  post '/habits/new', to: 'habits#create'

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
end
