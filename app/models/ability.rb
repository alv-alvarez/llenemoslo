class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.has_role? (:admin)
      can :manage, :all
    else user.has_role? (:guest)
      can :read, :all
    end
  end
end
