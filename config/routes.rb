Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :characters, only: [:index, :show]
  resources :matchups, only: [:show] do
    resources :matchup_items
  end

  get '/matchups/:id_as/:id_against', to: 'matchups#find_matchup'
end
