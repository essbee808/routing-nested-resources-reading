Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors, only: [:show] do 
    #nested resource for posts
    resources :posts, only: [:show, :index]
  end

  #still have regular resourced :posts routes because we want to let people
  #see all posts, create, edit outside of author
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  #tell routes which controller actions will handle them

end
