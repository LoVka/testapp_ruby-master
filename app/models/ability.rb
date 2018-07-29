class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    case user.role
    when User::ADMIN
      can :manage, :all
    when User::MANAGER
      can :manage, Category
      can :manage, EditorialList
      can :manage, Post
    when User::USER
      can :manage, Post, user_id: user.id
    end
  end
end
