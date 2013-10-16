module UsersHelper
  
  def user_level_options
    levels = 0..3
    levels.map do |level|
      fake_user = User.new
      fake_user.level = level
      [fake_user.user_level, level]
    end
  end
  
end
