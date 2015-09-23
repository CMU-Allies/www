class AdminMailer < ActionMailer::Base
  default from: "no-reply@allies.andrew.cmu.edu"
  
  def new_user_waiting_for_approval(user)
    @user = user
    @url = admin_user_edit_url(user)
    to = User.with_level(:admin).pluck(:email)
    
    mail(to: to, subject: "Registration Notification for ALLIES")
  end
end
