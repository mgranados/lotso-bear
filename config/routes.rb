LotsoBear::Application.routes.draw do

  resources :suppliers

  root 'sessions#new'
  resources :model_acronyms
  resources :orders
  resources :brands
  resources :mold_spares
  resources :sessions, only: [:new, :create, :destroy]
  resources :prevaluations, only: [:new, :create, :show]
  resources :valuations, only: [:index, :new, :create, :show]
  resources :spares, only: [:index, :new, :create, :show, :edit ,:destroy, :update]
  resources :generic_spares, only: [:index, :new, :create, :show, :edit ,:destroy, :update]

  resources :stock_families, only: [:index, :new, :show, :edit ,:destroy, :update] do
    member do
      get :label
    end
  end

  resources :generic_families, only: [:index, :new, :create, :show, :destroy, :edit] do
    collection do
      get :duplicate
      get :not_assigned
      get :assigned
      post :assign
    end
    member do
      get :count_spares
    end
  end

  resources :generic_cars, only: [:index, :new, :create, :show, :edit ,:destroy, :update] do
    member do
      get :assignation
      patch :relate_generic_family
    end
    collection do
      get :update_generation
      get :search
    end
  end


  resources :inventories do
    member do
      get :add_family_with_spares_to_order
    end


    collection do
      get :departure
      get :receive_order
      get :all
      get :add_new_stock
      post :add_to_inventory, to: 'stock_families#create'
      post :departure_stock_family
      resources :stock_families, only: [:create]
    end
  end


  # match '/login',              to: 'sessions#new',        via: 'get'
  # match '/admin',              to: 'branches#admin',      via: 'get'
  # match '/gerente',            to: 'branches#manager',    via: 'get'
  # match '/ajustador',          to: 'branches#adjuster',   via: 'get'
  # match '/operador',           to: 'branches#operative',  via: 'get'
  # match '/capturista',         to: 'branches#capturist',  via: 'get'
  # match '/proceso',            to: 'branches#process',    via: 'get'
  # match '/almacen',            to: 'branches#warehouse',  via: 'get'
  # match '/consultar',            to: 'client_actions#home', via: 'get'
  # match '/c/show',               to: 'client_actions#show', via: 'get'
  # match '/reports',              to: 'reports#index', via: 'get'
  # match '/reports/repair',       to: 'reports#repair', via: 'get'
  # match '/reports/insurance',    to: 'reports#insurance', via: 'get'
  # match '/reports/cars',         to: 'reports#cars', via: 'get'
  # match '/roster',              to: 'roster#index', via: 'get'
  # match '/roster/employeePerformance', to: 'roster#employeePerformance', via: 'get'
  # match '/roster/attendance',          to: 'roster#attendance', via: 'get'
  # match '/invoices',            to: 'invoices#home', via: 'get'
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'


  match '/new_generic_spare_from_template', to: 'generic_spares#template', via: 'get'
  match '/new_generic_car', to: 'generic_cars#new',  via: 'get'
  match '/update_generation', to: 'generic_cars#update_generation',  via: 'get'


  match '/busqueda', to: 'generic_cars#search',  via: 'get'
  match '/new_pre_valuations', to: 'prevaluations#new',   via: 'get'
  match '/login',              to: 'sessions#new',        via: 'get'
  match '/admin',              to: 'branches#admin',      via: 'get'
  match '/gerente',            to: 'branches#manager',    via: 'get'
  match '/ajustador',          to: 'branches#adjuster',   via: 'get'
  match '/operador',           to: 'branches#operative',  via: 'get'
  match '/capturista',         to: 'branches#capturist',  via: 'get'
  match '/proceso',            to: 'branches#process',    via: 'get'
  match '/almacen',            to: 'branches#warehouse',  via: 'get'

  match '/count_spares/:id', to:"generic_families#count_spares", via: 'get'

  #client actions routes
  match '/consultar',            to: 'client_actions#home', via: 'get'
  match '/c/show',               to: 'client_actions#show', via: 'get'
  match '/reports',              to: 'reports#index', via: 'get'
  match '/reports/repair',       to: 'reports#repair', via: 'get'
  match '/reports/insurance',    to: 'reports#insurance', via: 'get'
  match '/reports/cars',         to: 'reports#cars', via: 'get'

  match '/roster',              to: 'roster#index', via: 'get'
  match '/roster/employeePerformance', to: 'roster#employeePerformance', via: 'get'
  match '/roster/attendance',          to: 'roster#attendance', via: 'get'

  match '/invoices',            to: 'invoices#home', via: 'get'

  match '/nuevaTemplate',            to: 'generic_spares#newtemplate', via: 'get'


  # Route to a funciton that relates families to generic cars
  get '/relate_generic_family_to_generic_car/:id', to: 'generic_cars#relate_generic_family_to_generic_car', as: 'relate_generic_family_to_generic_car'

  get '/add_to_inventory', to: 'stock_families#new', via: 'post'

  #Signin Trabajadores
  match '/signin',  to: 'sessions#new',         via: 'get'
  #Salir
  match '/signout', to: 'sessions#destroy',     via: 'delete'


  get '/not_assigned_families', to: 'generic_families#not_assigned_families'
  get '/assigned_families', to: 'generic_families#assigned_families'
  match '/assign_families',         to: 'generic_families#assign', via: 'post'

  match '/search_for_generic_car', to: 'generic_cars#show_found_cars', via: 'post'


  get '/build_spares/:id', to: 'generic_families#build_spares', as: 'build_spare'

  get '/select_generic_families/:id', to: 'inventories#show_generic_car_generic_families', as: 'family_selection'

  get '/inventories/:family_id/:car_id/add_family_with_spares_to_order',to: 'inventories#add_family_with_spares_to_order'

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
