Rails.application.routes.draw do
  #resources :dog_houses, only: [:show]
  #resources :reviews, only: [:show, :index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #get '/dog_houses/:dog_house_id/reviews', to: 'dog_houses#reviews_index'
  #get '/dog_houses/:dog_house_id/reviews/:id', to: 'dog_houses#review' 
  #replace with
  Rails.application.routes.draw do

    resources :dog_houses, only: [:show] do
      # nested resource for reviews
      resources :reviews, only: [:show, :index]
    end
  
    #below we still have our regular resourced :reviews routes because we still want to let people see all reviews or a single review, create reviews, etc., outside of the context of a dog house.
    resources :reviews, only: [:show, :index, :create]
  end
end
