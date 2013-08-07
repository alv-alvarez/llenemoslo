class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.role? :super_admin
        can :manage, :all
    elsif user.role? :product_admin
        can :manage, [Product, Asset, Issue]
    end

  end
end
