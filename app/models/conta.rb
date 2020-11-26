class Conta < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :usuario, optional: true
  belongs_to :oficina, optional: true
  belongs_to :franquia, optional: true
end
