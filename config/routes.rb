Rails.application.routes.draw do
  root 'home#index'

  devise_for :users,  :controllers => { registrations: 'user/registrations' }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'perfil', to: 'user#ver_perfil'
    get 'edit_user', to: 'user/registrations#edit'
    patch 'update_user_registration', to: 'user/registrations#update'
  end

  resources :cuidador_paseadors, path: 'cuidadores-y-paseadores'
  resources :perros_perdidos, path: 'se-busca'
end
