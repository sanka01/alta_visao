Rails.application.routes.draw do
  resources :applications
  resources :usuarios do
  end
  resources :veiculos
  # get 'usuario/:cep', to: 'usuarios#consulta_endereco'


  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
