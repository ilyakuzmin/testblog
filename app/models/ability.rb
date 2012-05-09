class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Admin
    if user.admin?
      can :manage, :all

    # Guest
    elsif user.new_record?
      can :read, Post
      can :create, Comment

    # Registered user
    else
      can :manage, Post, :user_id => user.id
      can :read, Post
      can [:create, :destroy, :see_state], Comment, :user_id => user.id
    end
  end
end
