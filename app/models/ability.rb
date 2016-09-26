# Se crean los permisos por rol de usuario
# @author Luis Jose Padilla Benitez

class Ability
  include CanCan::Ability
  
  # Inbicializa los permisos por rol para acceder a cada parte de la
  # aplicación.
  def initialize(user)
    user ||= User.new
    
    if user.role_id == 1
      can :manage, :all
      cannot :manage, SubCategory
      cannot :manage, Role
      cannot :manage, SubCategory
    elsif user.role_id == 2
      can :manage, :all
      cannot :manage, Category
      cannot :manage, SubCategory
      cannot :manage, Role
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
