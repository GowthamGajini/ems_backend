Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees, only: [:create] do
        member do 
          get :income_details
        end
      end
    end
  end
end
