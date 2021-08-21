Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get "users/:id", :to => "users/registrations#detail", as: "mypage"
    get "users", :to => "users/registrations#index", as: "users"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get "users/edit/:id", :to => "users/registrations#edit", as: "edit_user"
    delete "users/:id", :to => "users/registrations#destroy", as: "delete_user"
  end

  root to: 'issues#index'
  resources :issues
end
