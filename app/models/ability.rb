class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
      can :manage, User
      can :read, RoomStatus
      can :export, RoomStatus
      can :manage, Officer
    end
    
    if user.editor?
      # Editors and admins have access to the admin panel
      can :access, :rails_admin
      can :dashboard
      
      # Articles
      can :manage, Article
    end
    
    if user.active?
      # Room status changes, mostly
      can :create, RoomStatus
    end
  end
end
