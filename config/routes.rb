Rails.application.routes.draw do
  resources :books
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# topページを表示
 get 'top' => 'homes#top'
#ルートパス
 root :to => 'homes#top'

end
