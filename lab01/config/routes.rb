Rails.application.routes.draw do
  root 'home#index'
  get '/newblog' => "blogs#new"
  post '/newblog' => "blog#create" , as: "blogs"
  devise_for :users,controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
