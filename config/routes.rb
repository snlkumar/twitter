Twitter::Application.routes.draw do
  devise_for :users
  as :user do
    get 'user/signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get 'my_following'=>'users#my_following',:as=>:my_following   
    
  end
  root :to=> "homes#index"

  resources :tweets do
    member do
      post :retweet      
    end
  end
  match ':name' => 'users#profile',:as=>:my_profile

  match ':controller(/:action(/:id))(.:format)'
end
