# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    #pp "este es el usuario", current_usuario.id
    if user.role == 'Administrador'
      return unless user.role == 'Administrador'  # additional permissions for administrators
      
      can :destroy, Usuario do |us|
        us.id != user.id
      end

      can :manage, Usuario
      can :manage, Sucursal
      can :manage, Horario


      #can :manage, :all 

    elsif user.role == 'Personal Bancario'
      return unless user.role == 'Personal Bancario' # additional permissions for personal bancario
      can :read, Usuario do |us|
        us.id == user.id || us.role == 'Cliente'
      end

      can :update, Usuario do |us|
        us.id == user.id
      end

      can :read, Turno do |turn|
        turn.sucursal_id == user.sucursal_id
      end

      can :update, Turno do |turn|
        turn.sucursal_id == user.sucursal_id
      end

      can :read, Sucursal

      can :read, Horario

      can :read, Usuario do |us|
        us.role == 'Cliente'
      end
      
    
    else
      return unless user.role == 'Cliente' # additional permissions for cliente
      can :read, Usuario do |us|
        us.id == user.id
      end

      can :update, Usuario do |us|
        us.id == user.id
      end

      can :create, Turno

      can :manage, Turno  do |turn|
        turn.user_id == user.id
      end

      can :read, Horario
    end
  end
end
