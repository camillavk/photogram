class Ability
  include CanCan::Ability

  def initialize(user)
   if user.nil?
      can :read, :all
    else
      can :read, :all
      can :create, [Post, Comment]
      can [:update, :destroy], [Post, Comment], :user_id => user.id
    end
  end
end
