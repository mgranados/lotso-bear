LotsoBear::Application.routes.draw do

  get "sinisters/new"
  resources :users
  resources :reports,   only:  [:index]
  resources :valuations,   only:  [:index,:new]

  resources :bills,     only:  [:index]
  resources :paysheets, only:  [:index]
  resources :sessions, only: [:new, :create, :destroy]


  # root to: 'sessions#new'
  root 'sessions#new'

  match '/login', to: 'sessions#new', via: 'get'
  match '/admin',  to: 'workshop#admin', via: 'get'
  match '/gerente',  to: 'workshop#manager', via: 'get'
  match '/ajustador',  to: 'workshop#adjuster', via: 'get'
  match '/operador',  to: 'workshop#operative', via: 'get'
  match '/capturista',  to: 'workshop#capturist', via: 'get'
  match '/proceso',  to: 'workshop#process', via: 'get'
  match '/almacen',  to: 'workshop#warehouse', via: 'get'
  match '/orders', to: 'stock#order', via: 'get'
  match '/dispatchs', to: 'stock#dispatch', via: 'get'
  match '/inventory', to: 'stock#inventory', via: 'get'

  #Signin Trabajadores
  match '/signin',  to: 'sessions#new',         via: 'get'
  #Salir
  match '/signout', to: 'sessions#destroy',     via: 'delete'




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
