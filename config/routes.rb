BackChannelApp2::Application.routes.draw do
  resources :comm_votes


  resources :comms


  resources :comments


  resources :post_votes


  resources :votes


  resources :categorizations





  resources :categories
  #resources :posts

  resources :users

  post "post/add_vote"
  get "login/logout"
  post "posts/comms/index"
 post "post/subtract_vote"
post "post/add_comment_vote"
  post "post/subtract_comment_vote"
  post "posts/show_search"
  get "users/destroy"
  post "comm/comm_delete"
  post "posts/report_generate"
  get "posts/report"


  match "/id10" => "users#destroy"
  match "/id" => "posts#add_vote"
  match "/cat_id" => "posts#index"
  match "/id2" => "posts#subtract_vote"
  match "/id3" => "posts#add_comment_vote"
  match "/id4" => "posts#add_comment_vote"
  match "/id5" => "posts#subtract_comment_vote"
  match "/id6" => "users#revoke"
  match "/id7" => "users#promote"
  match "/id8/id9" => "comms#comm_delete"

  resources :posts do
    resources :comms
 end


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
  root :to => 'login#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
