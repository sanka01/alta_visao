class Conta < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_initialize :default_values
  belongs_to :usuario, optional: true
  belongs_to :oficina, optional: true
  belongs_to :franquia, optional: true

  def is_admin?
    self.nivel_permissao == 0
  end
  private
  def default_values
    self.nivel_permissao ||= 1
  end
end
