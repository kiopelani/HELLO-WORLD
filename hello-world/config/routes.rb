Rails.application.routes.draw do

  devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  get 'dashboard' => 'dashboard#index'

  get 'dashboard/music' => 'music#index', as: 'music'
  get 'dashboard/newsitem' => 'newsitem#index'
  get 'dashboard/weather' => 'weather#index'
  get 'dashboard/alarm' => 'alarm#index'
  get 'dashboard/stocks' => 'stocks#index'
  post 'dashboard/stocks/add' => 'stocks#add'
  delete 'dashboard/stocks/delete' => 'stocks#destroy'
  get 'dashboard/stocks/endpoint' => 'stocks#endpoint'
  get 'dashboard/basketball' => 'basketball#index'
  get 'dashboard/basketball/endpoint' => 'basketball#endpoint'
  get 'dashboard/football' => 'football#index'
  get 'dashboard/football/endpoint' => 'football#endpoint'
  get 'dashboard/add_widgets' => 'dashboard#add_widgets', as: 'add_widgets'
  get 'dashboard/clock' => 'clock#index', as: 'clock'

  get '/auth/spotify/callback', to: 'music#spotify'


  resources :widgets

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # resources :dashboard

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
