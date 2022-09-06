Rails.application.routes.draw do
root to: "public/homes#top"

get "home/about" => "public/homes#about" ,as: 'about'

resource:public
resource:admin

scope module: :public do
  resources:items
  resources:addresses
  resources:customers
  resources:cart_items
  resources:orders
  get "orders/complete" => "orders#complete"
  get "custemers/unsubscribe" => "custemers#unsubscribe"
  patch "custemers/withdraw" => "custemers#withdraw"
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
  post "orders/comfirm" => "orders#comfirm"
end

namespace :admin do
  resources:items
  resources:genres
  resources:customers
end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
