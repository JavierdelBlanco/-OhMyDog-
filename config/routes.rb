Rails.application.routes.draw do
  resources :cuidador_paseadors, path: 'cuidadores-y-paseadores'
  root 'home#index'
  get 'se-busca', to: 'se_busca#index'
  get 'user/login'
end
