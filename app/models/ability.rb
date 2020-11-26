class Ability
  include CanCan::Ability

  def initialize(conta)
    can :create, Usuario, public: true

    if conta.present?  # additional permissions for logged in users (they can read their own posts)
      can :read, Conta, conta_id: conta.id

      if conta.nivel_permissao == 0  # additional permissions for administrators
        can :manage, :all
      end
    end
  end
end