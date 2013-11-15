class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
      # In addition to editor stuff, admins can manage users,
      # and manage officers
      can :manage, User
      can :manage, Officer
    end
    
    if user.editor? or user.admin?
      # Editors and admins have access to the admin panel
      can :access, :rails_admin
      can :dashboard
      
      can :manage, Article
      can :manage, Resource
      can :manage, ResourceCategory
      can :manage, NewsFeed
      can :manage, OfficeHour
    end
    
    if user.active?
      # Room status changes, mostly
      can :update, RoomStatus
    end
  end
end
