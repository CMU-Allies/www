class Officer < ActiveRecord::Base
  belongs_to :user
  
  def name
    if user
      user.first_name + " " + user.last_name
    else
      ""
    end
  end
end
