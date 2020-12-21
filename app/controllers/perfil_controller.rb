class PerfilController < ApplicationController
  def show
    @usuario = Usuario.find params[:usuario_id]
  end
end
