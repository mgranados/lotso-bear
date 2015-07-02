# -*- encoding : utf-8 -*-
LotsoBear::Application.routes.draw do
  resources :stock_cars

  root 'sessions#new'

  resources :brands
  resources :suppliers
  resources :mold_spares
  resources :model_acronyms
  resources :sessions, only: [:new, :create, :destroy]
  resources :prevaluations, only: [:new, :create, :show]
  resources :valuations, only: [:index, :new, :create, :show]
  resources :spares, only: [:index, :new, :create, :show, :edit ,:destroy, :update]
  resources :generic_spares, only: [:index, :new, :create, :show, :edit ,:destroy, :update]
  resources :users
    
# <SUPPLIES>


  #get '/supplies/:user_id/spend', to: 'supplies#spend', as: 'spend_dsupplies' #getting the user id in the path
  post '/supplies/spend', to: 'supplies#spend', as: 'spend_supplies' #getting the user 

  get '/supplies/consumer', to: 'supplies#consumer', as: 'consumer_supplies'
  resources :supplies do
  end
# </SUPPLIES>

# <WAREHOUSES>
  resources :warehouses do
    resources :sections, shallow: true do
      resources :subsections, shallow: true do
        member do
          get :print_label
        end
      end
    end
  end
# </WAREHOUSES>

# <STOCK_FAMILIES>
  post 'stock_families/print_label', to: 'stock_families#print_label', as: 'print_label_stock_family'
  resources :stock_families, only: [:index, :new, :show, :edit ,:destroy, :update] do
    member do
      get :history
      get :choose_labels
    end
  end
# </STOCK_FAMILIES>

# <STOCK_SPARES>
  resources :stock_spares, only: [:edit,:show,:update] do
    member do
      get :history
    end
  end
# </STOCK_SPARES>
  
# <ORDERS>
  resources :orders do
    member do
      post :print_label
      get :history
    end
  end
# </ORDERS>

# <GENERIC_FAMILIES>
  resources :generic_families, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get :not_assigned
      get :assigned
      post :assign
    end
    member do
      get :count_spares
    end
  end
# </GENERIC_FAMILIES>

# <GENERIC_CARS>
  resources :generic_cars, only: [:index, :new, :create, :show, :edit ,:destroy, :update] do
    member do
      get :assignation
      patch :relate_generic_family
    end
    collection do
      get :update_generation
      post :search_by_model
    end
  end
# </GENERIC_CARS>

# <INVENTORIES>
    get '/select_generic_families/:id', to: 'inventories#show_generic_car_generic_families', as: 'family_selection'
    get '/inventories/:family_id/:car_id/add_family_with_spares_to_order',to: 'inventories#add_family_with_spares_to_order'
  resources :inventories do
    member do
      get :add_family_with_spares_to_order
    end
    collection do
      get :worker #Route to select an emplooyee with a searching form -> 
      get :acomodate
      post :save_store_stocks
      post :store_stocks

      get :departure

      get :all

      get :add_new_stock

      post :search_stock
      get :search_stock

      post :add_to_inventory, to: 'stock_families#create'
      post :departure_stock_family
      resources :stock_families, only: [:create]
      resources :supplies
    end
  end
# </INVENTORIES>

# <CLIENTS>
  match '/consultar',            to: 'client_actions#home', via: 'get'
  match '/c/show',               to: 'client_actions#show', via: 'get'
# </CLIENTS>


# <USERS>
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
# </USERS>

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
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
