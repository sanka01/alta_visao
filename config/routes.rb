Rails.application.routes.draw do
  # devise_for :contas
  devise_for :contas, path_names: {sign_in: 'entrar', sign_out: 'sair', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'registrar', sign_up: 'cadastrar'}

  resources :contas
  resources :instalacoes
  resources :oficinas
  resources :franquias
  resources :applications
  resources :usuarios
  resources :veiculos
  # get 'usuario/:cep', to: 'usuarios#consulta_endereco'
  get "administrador", to: "application#administrador"
  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
