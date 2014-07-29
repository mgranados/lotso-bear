LotsoBear::Application.routes.draw do

  resources :reports,   only:  [:index]
  resources :bills,     only:  [:index]
  resources :paysheets, only:  [:index]
  resources :valuations, only:  [:new,:edit]
  resources :stocks, only:  [:inventory,:order,:dispatch]


  #Taller
  match '/w',  to: 'workshop#index',      via: 'get'
  #Administrador
  match '/a',  to: "workshop#admin",      via: 'get'
  #Gerente
  match '/m',  to: "workshop#admin",      via: 'get'
  #Operador
  match '/o',  to: "workshop#operator",   via: 'get'
  #Pedido
  match '/orders',  to: 'stocks#order',      via: 'get'
  #Iventario
  match '/inventory',  to: 'stocks#inventory',      via: 'get'
  #Envio
  match '/dispatchs',  to: 'stocks#dispatch',      via: 'get'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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
