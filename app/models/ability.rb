class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.persisted?
      can :manage, Post, author: user
    end
  end
end
