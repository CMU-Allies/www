class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
  
  validates :first_name, :last_name, :level, presence: true
  validates :login, presence: true, uniqueness: { case_sensitive: false }
  
  extend Enumerize
  enumerize :level, in: [:inactive, :trained, :editor, :admin], :predicates => true, :scope => true
  
  def active?
    not inactive?
  end
  
  def full_name
    first_name + " " + last_name
  end
  
  def self.find_for_database_authentication(conditions)
    self.where(:login => conditions[:login]).first
  end
  
  def active_for_authentication? 
    super && active?
  end 

  def inactive_message 
    if inactive? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver if inactive?
  end
  
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.active?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
end
