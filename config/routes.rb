Rails.application.routes.draw do
  resources :perritos
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'user/registrations'
  }
  resources :users, only: [:index]
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'perfil', to: 'user#ver_perfil'
    get 'edit_user', to: 'user/registrations#edit'
    patch 'update_user_registration', to: 'user/registrations#update'
  end
  resources :users do
    collection do
      get 'atencion'
    end
  end
  get '/perfil/:id', to: 'user#ver_perfil', as: 'ver_perfil'
  get 'atencion_cliente', to: 'user#atencion'
  #get 'add_dog', to: 'user#agregar_perro'
  get 'edit_perro.:id', to: 'perros#edit'
  get 'add_dog', to: 'perritos#new'
  resources :perros, only: [:new, :create, :edit, :update, :destroy]
  resources :usuarios do
    resources :perros
  end
  resources :cuidador_paseadors, path: 'cuidadores-y-paseadores'
  resources :perros_perdidos, path: 'se-busca'
end
