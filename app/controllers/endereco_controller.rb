class EnderecoController < ApplicationController
  def new
    @endereco = Endereco.new
  end
end
