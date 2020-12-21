class Conta < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_initialize :default_values
  belongs_to :usuario, optional: true
  belongs_to :oficina, optional: true
  belongs_to :franquia, optional: true

  enum nivel_permissao: {
    administrator: 0,
    cliente: 1,
    franqueado: 2,
  }

  def is_admin?
    self.nivel_permissao == "administrator"
  end
  def is_franqueado?
    self.nivel_permissao == "franqueado"
  end
  private
  def default_values
    self.nivel_permissao ||= 1
  end
end
