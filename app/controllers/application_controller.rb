class ApplicationController < ActionController::Base
  before_action :authenticate_conta!, only: [:administrador]
  # before_action :authenticate_admin!, only: [:administrador]

  def index
  end

  def administrador
    if current_conta.is_admin?
      render :administrador
    else
      current_conta.errors.add(:nivel_acesso, " Não autorizado")
      render :index
    end
  end


end
