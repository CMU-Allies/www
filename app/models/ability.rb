class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
      can :manage, :all
    end
    
    if user.editor?
      # Articles
    end
    
    if user.active?
      can :read, User, :id => user.id
      # Room status changes, mostly
    end
  end
end
