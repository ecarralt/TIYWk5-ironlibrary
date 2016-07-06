Rails.application.routes.draw do

  get "/" => "books#home", as: :home

  get "/books/new" => "books#newbook", as: :new_book
  post "books/create" => "books#create", as: :create_book

  get "/books/:id/edit" => "books#editbook", as: :edit_book
  patch "/books/:id" => "books#update", as: :update

  get "/books/:id" => "books#show", as: :show

  delete "/books/:id" => "books#delete", as: :delete

  get "sign_in" => "sessions#new", as: :sign_in
  post "sign_in" => "sessions#create", as: :create_sign_in
  delete "sign_in" => "sessions#delete", as: :sign_out


  get "/api/books" => "api/books#index", as: :api_books
  get "/api/books/:id" => "api/books#show", as: :api_show




  # post "/checkouts/:book_id/:user_id" => "checkouts#create", as: :checkout
  # delete "/checkouts/:id" =< "checkouts#delete", as: :checkin



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
