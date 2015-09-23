module Admin::UsersHelper
  
  def levels_for_select(selected=nil)
    options_for_select(User.level.values.map {|level| [User.new(level: level).level_text, level]}, selected)
  end
  
end
