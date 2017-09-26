Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'
  get '/newblog' => "blogs#new", as: "new_blog"
  post '/newblog' => "blog#create" , as: "blogs"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
