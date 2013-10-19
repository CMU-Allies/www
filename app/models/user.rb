class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :encryptable, authentication_keys: [:login], :encryptor => :restful_authentication_sha1
  
  validates :first_name, :last_name, presence: true
  validates :login, presence: true, uniqueness: { case_sensitive: false }
  validates :level, inclusion: { in: 0..3 }, presence: true
  
  def self.user_level(level)
    case level
    when 0
      "Not activated"
    when 1
      "SafeZone Trained"
    when 2
      "Editor"
    when 3
      "Admin"
    end
  end
  
  def user_level
    User.user_level self.level
  end
  
  def active?
    self.level >= 1
  end
  
  def editor?
    self.level >= 2
  end
  
  def admin?
    self.level >= 3
  end
  
  def self.find_for_database_authentication(conditions)
    self.where(:login => conditions[:login]).first
  end
  
  def active_for_authentication? 
    super && active? 
  end 

  def inactive_message 
    if !active? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver unless self.level > 0
  end
  
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
  
  rails_admin do
    object_label_method do
      :login
    end
    
    list do
      field :login
      field :email
      field :first_name
      field :last_name
      field :level do
        pretty_value do
          bindings[:object].user_level
        end
      end
    end
    
    edit do
      field :login
      field :email
      field :first_name
      field :last_name
      field :level do
        def render
          bindings[:view].render :partial => "user_level_select", :locals => {:field => bindings[:object]}
        end
      end
    end
  end
end
