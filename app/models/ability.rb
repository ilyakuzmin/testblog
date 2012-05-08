class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Admin
    if user.admin?
      can :manage, :all

    # Guest
    elsif user.new_record?
      can :read, :all

    # Registered user
    else
      can :manage, Post, :user_id => user.id
      can [:create, :delete], Comment, :user_id => user.id
    end
  end
end
