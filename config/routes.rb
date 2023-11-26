Rails.application.routes.draw do
  resources :historia_clinicas
  resources :ambulatoria
  resources :desparasitacions
  resources :vacuna_rs
  resources :vacuna_es
  resources :castracions
  resources :historia_cs

  resources :perros_en_adopcions
  resources :turnos
  resources :solicitud_turnos
  get 'gestion-turnos', to: 'gestion_turnos#index'
  post 'gestion_turnos', to: 'gestion_turnos#generar', as: 'generar_turno'
  post 'gestion_turnos/rechazar', to: 'gestion_turnos#rechazar', as: 'rechazar_turno'

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
  resources :users do
    resources :perritos # Esto anida las rutas de perritos dentro de las rutas de usuarios
  end


  get 'profile/edit', to: 'profile#edit', as: :edit_profile
  end

  #Creacion de usuario del veterinario
  get 'creacion_usuario', to: 'users/registro#new', as: 'creacion_usuario'
  post 'creacion_usuario', to: 'users/registro#create'

  #Atencion al cliente
  get 'perrito_ajeno/:id', to: 'perritos#new_ajeno', as: 'perrito_ajeno'
  get 'edit_other/:id', to: 'users#edit_otro', as: 'edit_other'
  get 'usuarios/:id', to: 'users#ver_perfil'
  get '/perfil/:id', to: 'users#ver_perfil', as: 'ver_perfil'
  get 'atencion_cliente', to: 'users#atencion'

  #Interfaz de los perros
  get 'show_perrito/:id', to: 'perritos#show', as: 'show_perrito'
  get 'add_dog.:id', to: 'perritos#new', as: 'add_dog'
  get 'marcar_fallecido/:id', to: 'perritos#marcar_fallecido', as: 'marcar_fallecido'
  resources :perritos do
    member do
      patch 'marcar_fallecido'
    end
  end
  #Historia clinica del perro
  get 'ver_perrito/:id', to: 'perritos#ver', as: 'ver_perrito'
  get 'crear_historia/:id', to: 'perritos#agregar_historia', as: 'crear_historia'
  get 'crear_castracion/:id', to: 'historia_clinicas#new_castracion', as: 'crear_castracion'
  get 'crear_vacunae/:id', to: 'historia_clinicas#new_vacunae', as: 'crear_vacunae'
  get 'crear_vacunar/:id', to: 'historia_clinicas#new_vacunar', as: 'crear_vacunar'
  get 'crear_desparasitacion/:id', to: 'historia_clinicas#new_desparasitacion', as: 'crear_desparasitacion'
  get 'crear_atencion_clinica/:id', to: 'historia_clinicas#new_atencion_clinica', as: 'crear_atencion_clinica'
  resources :historia_clinicas do
    post 'create_vacunar', on: :collection
    post 'create_vacunae', on: :collection
  end

  #Envio de mail de joaco
  post '/random_password_email', to: 'user_mailer#random_password_email'


  resources :cuidador_paseadors, path: 'cuidadores-y-paseadores'
  resources :perros_perdidos, path: 'se-busca'

  resources :perros_encontrados do
    collection do
      get 'edit_no_registrado'
    end
  end

  resources :perros_encontrados
  resources :perritos

  patch '/perros_perdidos/:id/marcar_como_encontrado', to: 'perros_perdidos#marcar_como_encontrado', as: :marcar_como_encontrado_perros_perdido
  patch '/perros_encontrados/:id/marcar_como_dueno_encontrado', to: 'perros_encontrados#marcar_como_dueno_encontrado', as: :marcar_como_dueno_encontrado_perros_encontrado
  patch '/perros_en_adopcion/:id/marcar_como_adoptado', to: 'perros_en_adopcions#marcar_como_adoptado', as: :marcar_como_adoptado_perros_en_adopcion
  #mails javi
  post '/enviar_correo', to: 'cuidador_paseadors#enviar_correo'
  post '/enviar_correo_no_registrado', to: 'cuidador_paseadors#enviar_correo_no_registrado'

  post '/enviar_correo_perros_perdidos', to: 'perros_perdidos#enviar_correo_perros_perdidos'
  post '/enviar_correo_perros_encontrados', to: 'perros_encontrados#enviar_correo_perros_encontrados'
  post '/enviar_correo_perros_encontrados_no_registrado', to: 'perros_encontrados#enviar_correo_perros_encontrados_no_registrado'

  resources :perros_encontrados do
    member do
      post 'enviar_correo_perros_encontrados_no_registrado'
    end
  end

 # config/routes.rb
get '/perros_encontrados/edit_no_registrado', to: 'perros_encontrados#edit_no_registrado', as: 'edit_no_registrado_perros_encontrado'








  post '/enviar_correo_perros_perdidos_contactar', to: 'perros_perdidos#enviar_correo_perros_perdidos_contactar'
  post '/enviar_correo_perros_encontrados_contactar', to: 'perros_encontrados#enviar_correo_perros_encontrados_contactar'
  post '/enviar_correo_contactar_registrado', to: 'perros_en_adopcions#enviar_correo_contactar_registrado'
  post '/enviar_correo_contactar_no_registrado', to: 'perros_en_adopcions#enviar_correo_contactar_no_registrado'



end
