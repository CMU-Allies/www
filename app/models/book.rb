class Book < ActiveRecord::Base
  belongs_to :user

  def self.search_conditions(term)
    sanitize_sql([ "title LIKE '%%%s%%' OR first_name LIKE '%%%s%%' OR last_name LIKE '%%%s%%' OR synopsis LIKE '%%%s%%' OR category LIKE '%%%s%%'",term,term,term,term,term])
  end
end
