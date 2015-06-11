Rails.application.routes.draw do
#admin
  get 'admin' => 'admin#index'
  get 'admin/area/:id' => 'admin#admin_place'
  get 'admin/post' => 'admin#admin_post'

  get 'admin/area/:id/edit' => 'admin#edit_area'
  patch 'area.:id' => 'admin#update_area'

  get 'admin/area/:first/place/:second/edit' => 'admin#edit_place'
  patch 'place.:second' => 'admin#update_place'

  get 'admin/post/:id/edit' => 'admin#edit_post'
  get 'admin/post/:id/delete' => 'admin#delete_post'
  patch 'post.:id' => 'admin#update_post'

  ##form_forはすでに保存されてるデータに対しては自動的にpatchになる
  ##更新時は多分モデル名がまんまディレクトリになる為、/admin/postにしない

#show
  get 'show/top'

  get 'show/detail'

  root 'show#top'
  post "preusers" => "hello#create"

  get 'top' => 'show#top'

  get 'area/:id' => 'show#area'
  get 'area/:first/place/:second' => 'show#place'

  get 'post' => 'show#post'
  post "posts" => "show#create_post"

  get 'area/:first/place/:second/post' => 'show#post'

  get 'post/complete' => 'show#complete'

  get 'area/:first/place/:second/post/:third' => 'show#detail'

  get 'about' => 'show#about'
  get 'policy' => 'show#policy'
  get 'guideline' => 'show#guideline'

  get 'select_place' => 'show#select_place'

  get 'area/:first/place/:second/logs/:third' => 'show#logs'


  devise_for :users

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
