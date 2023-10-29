Rails.application.routes.draw do
  root 'home#index'
  get 'se-busca', to: 'se_busca#index'
  get 'cuidadores-y-paseadores', to: 'cuidadores_y_paseadores#index'
  get 'user/login'
end
