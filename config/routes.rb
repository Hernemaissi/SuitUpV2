Suitupv2::Application.routes.draw do

 
  
  resources :image_albums
  resources :adverts
  resources :companies, only: [:index, :show, :create, :new]
  devise_for :users
  resources :users, :only => [:show]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  scope "(:locale)", :locale => /fi|en/ do
    root :to => "static#index"
    get '/about' => "static#about"
    get '/search' => "search#index"
    get '/contact' => "static#contact"  
    get '/users/:id' => 'users#show', :as => 'profile'

  end

  match '/adverts/rent/:id', to: 'adverts#rent', :as => :rent, via: [:get, :post]
  get '/adverts/impressions/:id', to: 'adverts#impressions', :as => :impressions, :defaults => { :format => 'json' }

  # get 'adverts/impressions' => 'adverts#impressions'
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
  #       post 'rent'
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
  #   concern :rentable do
  #     post 'rent'
  #   end
  #   resources :posts, concerns: :rentable
  #   resources :photos, concerns: :rentable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
