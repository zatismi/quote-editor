Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"



  resources :quotes do
    resources :line_item_dates, except: [ :index, :show ] do
      resources :line_items, except: [ :index, :show ]
    end
  end

  # ✅ DONE
  scope controller: :errors, path: "errors" do
    get :bad_request
    get :unprocessable_entity
    get :internal_server_error
  end


  get "errors/bad_request", to: "errors#bad_request"
  get "errors/not_found", to: "errors#not_found"

  match "*path", to: "errors#not_found", via: :all
end
