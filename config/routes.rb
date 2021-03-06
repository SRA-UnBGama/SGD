Rails.application.routes.draw do
  resources :teams

  resources :evaluation_items

  devise_for :users
  resources :learning_solutions

  resources :phases, :only => [:edit, :update]
  resources :evaluation_periods

  resources :working_conditions

  resources :goals

  resources :competences

  resources :users

  resources :evaluations

  resources :auto_evaluations

  resources :permissions

  post "/teams/confirm_team", to: "teams#confirm_team"
  post "/teams/not_confirm_team", to: "teams#not_confirm_team"

  post "users/activate_admin",to: "users#activate_admin"
  post '/permissions/:id/edit', to: 'permissions#update'
  get '/permissions/:id', to: 'permissions#index'
  devise_scope :user do
  authenticated :user do
    root 'home#index'
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
