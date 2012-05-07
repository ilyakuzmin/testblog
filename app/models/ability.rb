class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.new_record?
      can :read, :all
    else
      can :manage, Post, :user_id => user.id
    end
  end
end
