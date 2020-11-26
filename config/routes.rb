Rails.application.routes.draw do
  devise_for :contas
  resources :contas
  resources :instalacoes
  resources :oficinas
  resources :franquias
  resources :applications
  resources :usuarios
  resources :veiculos
  # get 'usuario/:cep', to: 'usuarios#consulta_endereco'


  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
