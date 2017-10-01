Rails.application.routes.draw do
  resources :blogs
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'
  post '/blogs/:id/comment' => "comment#create" ,as: "create_comment"
  delete '/comments/:id' => "comment#destroy" , as: "comment"
  get '/user/blog' => "blogs#userblog" , as: "user_blog"
  resources :albums
  post '/albums/:id/newimage' => "albums#add_image" , as: "new_image"
  get 'images/:id' => "images#show"  , as: "image"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
