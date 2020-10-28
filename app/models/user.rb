class User < ApplicationRecord
  enum tipo_usuario: {
      administrator: 0,
      pre_cadastro: 1,
      cliente: 2,
      empreendedor: 3
  }
end
