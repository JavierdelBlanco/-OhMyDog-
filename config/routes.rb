Rails.application.routes.draw do
  root 'home#index'

  resources :cuidador_paseadors, path: 'cuidadores-y-paseadores'
  resources :perros_perdidos, path: 'se-busca'

  get 'user/login'
end
