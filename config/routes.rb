Rails.application.routes.draw do
resources :perros_perdidos, path: 'se-busca'
  root 'home#index'

  
  get 'contactar_dog', to: 'se_busca#contactar'

  get 'cuidadores-y-paseadores', to: 'cuidadores_y_paseadores#index'
  get 'user/login'
end
