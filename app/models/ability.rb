class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
      # In addition to editor stuff, admins can manage users,
      # see a log of room status changes, and manage officers
      can :manage, User
      can :read, RoomStatus
      can :export, RoomStatus
      can :manage, Officer
    end
    
    if user.editor?
      # Editors and admins have access to the admin panel
      can :access, :rails_admin
      can :dashboard
      
      can :manage, Article
      can :manage, Resource
      can :manage, ResourceCategory
      can :manage, NewsFeed
    end
    
    if user.active?
      # Room status changes, mostly
      can :create, RoomStatus
    end
  end
end
