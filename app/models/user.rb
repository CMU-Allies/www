class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :encryptable, authentication_keys: [:login], :encryptor => :restful_authentication_sha1
  
  validates :first_name, :last_name, :level, presence: true
  validates :login, presence: true, uniqueness: { case_sensitive: false }
  
  extend Enumerize
  enumerize :level, in: [:inactive, :trained, :editor, :admin], :predicates => true, :scope => true
  
  def active?
    not inactive?
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
  
  before_create :approve_safezone_trained
  def approve_safezone_trained
    if inactive?
      begin
        config = YAML.load(File.read(Rails.root.join("config", "google_drive.yml").to_s))
        session = GoogleDrive.login(config["username"], config["password"])
        worksheet = session.spreadsheet_by_key(config["spreadsheet"]).worksheets[0]
      
        for row in 2..worksheet.num_rows
          if worksheet[row,1] == self.email
            if worksheet[row,2].downcase == self.first_name.downcase and worksheet[row,3].downcase == self.last_name.downcase
              self.level = :trained
              break
            else
              self.errors.add(:email, "Your email and name do not match the data in the SafeZone trained database.")
              return false
            end
          end
        end
      rescue Exception => e
        Rails.logger.error("Google drive information for SafeZone trained database is invalid:\n" + e.to_s)
      end
    end
  end
  
  after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver if inactive?
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
      field :level
    end
    
    edit do
      field :login
      group :password do
        field :password
        field :password_confirmation
        help "If you are creating a new user, these fields are required. If you are editing an existing user and do not want to change their password, leave these fields blank."
      end
      field :email
      field :first_name
      field :last_name
      field :level
    end
  end
end
