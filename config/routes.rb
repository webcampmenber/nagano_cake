Rails.application.routes.draw do
  
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    get "customers/withdrawal_confirmation" => "customers#withdrawal_confirmation", as: "withdrawal_confirmation"
    patch "customers/withdrawa_process" => "customers#withdrawa_process", as: "withdrawa_process"
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"
    get "orders/thanks" => "orders#thanks", as: "thanks"
    post "orders/confirmation" => "orders#confirmation", as: "confirmation"
    
    resources :homes, only:[:top, :about]
    resources :items, only:[:index, :show]
    resource :customers, only:[:show, :esit, :update]
    resources :cart_items, only:[:index, :create, :update]
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:create, :index, :edit, :update, :destroy]
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
     registrations: "public/registrations",
     sessions: 'public/sessions'
    }
  
  namespace :admin do
    root to: "homes#top"
    
    resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:create, :index, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
end
