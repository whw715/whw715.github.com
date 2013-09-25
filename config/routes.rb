#encoding: utf-8
OnlineCinemaTicket::Application.routes.draw do

  resources :order_lines

  resources :orders

  resources :administrators

  controller :administrators do
    get 'admin' => :admin
  end

  resources :actors

  controller :sessions do
    get 'admin_login'  => :admin_new
    post 'admin_login' => :admin_create
    get 'login'        => :new
    post 'login'       => :create
    delete 'logout'    => :destroy
  end

  resources :store

  controller :store do
    get 'index'      => :index
    get 'show_now'   => :show_now
    get 'show_after' => :show_after
    get 'about'      => :about
  end
    
  resources :accounts 

  controller :accounts do
    get 'newuser' => :new
    get 'detail'  => :detail
  end

  controller :choose do
    get 'show_ticket' => :show_ticket
    get 'show_seat'   => :show_seat
    post 'ensure_order' => :ensure_order
    get 'ensure_order' => :ensure_order
  end
  
  resources :tickets

  resources :films

  controller :film do
    get 'moreinfo' => :moreinfo
  end

  resources :about

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'store#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
