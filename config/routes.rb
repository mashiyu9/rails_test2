Rails.application.routes.draw do

  resources :chats do

    collection do
     patch :confirm
     post :confirm
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
