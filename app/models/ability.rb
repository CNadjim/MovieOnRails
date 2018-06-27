class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role?(:admin)
      can :manage, Movie
    else
      #can : read, Movie
      can :manage, Movie
    end

  end
end
