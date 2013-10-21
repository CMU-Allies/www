class AdminMailer < ActionMailer::Base
  default from: "no-reply@allies.andrew.cmu.edu"
  
  def new_user_waiting_for_approval(user)
    @user = user
    @url = rails_admin.edit_url(model_name: 'user', id: user.id)
    to = User.admins.pluck(:email)
    
    mail(to: to, subject: "ALLIES@CMU: New User Waiting For Approval")
  end
end
