Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, path_prefix: 'my', controllers: {
    registrations: 'users/registrations'
  }
 # devise_for :users,: :path_prefix => 'my'
  resources :users, only: [:index, :atencion]
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'perfil', to: 'users#ver_perfil'
    get 'edit_user', to: 'users/registrations#edit'
    patch 'update_user_registration', to: 'users/registrations#update'
  end
  resources :users do
    collection do
      get 'atencion'
    end
  resources :users do
    member do
      get 'agregar_perrito'
      post 'crear_perrito'
    end
  end  
  get 'new_usuario_perrito', to: 'perritos#new'
  get 'profile/edit', to: 'profile#edit', as: :edit_profile
  end
  get 'edit_other/:id', to: 'users#edit_otro', as: 'edit_other'
  get 'usuarios/:id', to: 'users#ver_perfil'
  get '/perfil/:id', to: 'users#ver_perfil', as: 'ver_perfil'
  get 'atencion_cliente', to: 'users#atencion'
  get 'add_dog', to: 'perritos#new'
  resources :users do
    resources :perritos, only: [:new, :create]
  end
  #mi mail envio
  post '/random_password_email', to: 'user_mailer#random_password_email'
  resources :cuidador_paseadors, path: 'cuidadores-y-paseadores'
  resources :perros_perdidos, path: 'se-busca'
  resources :perros_encontrados
  resources :perritos

  patch '/perros_perdidos/:id/marcar_como_encontrado', to: 'perros_perdidos#marcar_como_encontrado', as: :marcar_como_encontrado_perros_perdido
  patch '/perros_encontrados/:id/marcar_como_dueno_encontrado', to: 'perros_encontrados#marcar_como_dueno_encontrado', as: :marcar_como_dueno_encontrado_perros_encontrado
  #mails javi
  post '/enviar_correo', to: 'cuidador_paseadors#enviar_correo'
  post '/enviar_correo_no_registrado', to: 'cuidador_paseadors#enviar_correo_no_registrado'

  post '/enviar_correo_perros_perdidos', to: 'perros_perdidos#enviar_correo_perros_perdidos'

end
