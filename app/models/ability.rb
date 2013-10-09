class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Post, author: user
  end
end
