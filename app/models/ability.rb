class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :read, :all
      can :update, Category
    elsif user.user?
      can :read, :all
    elsif user.viewer?
      can :read, :all
    end
  end
end
