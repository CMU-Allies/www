class AdminMailer < ActionMailer::Base
  default from: "no-reply@allies.andrew.cmu.edu"
  
  def new_user_waiting_for_approval(user)
    @user = user
    @url = edit_user_url(user)
    
    User.where(:level => 3).each do |admin|
      mail(to: admin.email, subject: "ALLIES@CMU: New User Waiting For Approval")
    end
  end
end
