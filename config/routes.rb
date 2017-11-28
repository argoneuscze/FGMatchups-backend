Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :characters
  resources :matchups do
    resources :matchup_items
  end
end
