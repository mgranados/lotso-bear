LotsoBear::Application.routes.draw do
  root 'sessions#new'

  resources :users
  resources :model_acronyms
  resources :brands
  resources :mold_spares
  resources :sessions, only: [:new, :create, :destroy]
  resources :prevaluations, only: [:new, :create, :show]
  resources :valuations, only: [:index, :new, :create, :show]
  resources :spares, only: [:index, :new, :create, :show, :edit ,:destroy, :update]
  resources :generic_spares, only: [:index, :new, :create, :show, :edit ,:destroy, :update]

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
      get :relate_generic_family
    end
    collection do
      get :update_generation
      get :search
    end
  end

  resources :inventories do
    collection do
      get :entrance
      get :departure
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
