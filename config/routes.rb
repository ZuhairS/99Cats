NinetyNineCatsDay1::Application.routes.draw do
  resources :users, only: [:create, :new]
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end

  resource :session, only: [:new, :create, :destroy]

  root to: redirect("/cats")
end
