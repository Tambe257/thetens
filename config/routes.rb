Thetens::Application.routes.draw do
  resources :comments do
    resources :pins
    resources :users
  end  

  resources :pins do

    resources :comments
  end  

  
  resources :pins


  devise_for :users
  resources :users, only: [:show, :tens2000, :tens2001, :tens2002, :tens2003, :tens2004, :tens2005, :tens2006, :tens2007, :tens2008, :tens2009, :tens2010, :tens2011, :tens2013, :tens2012] do
    member do
      get :show
      get :tens2000
      get :tens2001
      get :tens2002
      get :tens2003
      get :tens2004
      get :tens2005
      get :tens2006
      get :tens2007
      get :tens2008
      get :tens2009
      get :tens2010
      get :tens2011
      get :tens2012
      get :tens2013
      get :tens5star
      get :tensnum1s
    end
  end    

  #match 'users/:id' => 'users#show', as: :user
  
  #match 'users/:id' => 'users#tens2011'
  # devise_for :installs

  root :to => 'pins#index'

  get 'stats' => 'pages#stats' 

  get 'reviewers' => 'pages#reviewers'

  get 'comments_board' => 'pages#comments_board'

  get 'tens2013' => 'pages#tens2013'

  get 'tens2012' => 'pages#tens2012'

  get 'five_star' => 'pages#five_star'

  get 'number_ones' => 'pages#number_ones'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
