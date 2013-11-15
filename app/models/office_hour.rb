class OfficeHour < ActiveRecord::Base
  belongs_to :user
  
  extend Enumerize
  enumerize :day, :in => [:monday, :tuesday, :wednesday, :thursday, :friday]
  
  validates :user, :day, :starts, :ends, :presence => true
  validate :valid_timespan
  
  def valid_timespan
    errors.add(:base, "Office hour must be at least 30 minutes.") if ends - starts < 30.minutes
  end
  
  def starts=(ts)
    if ts.class == String and !ts.numeric?
      write_attribute(:starts, Time.parse(ts).seconds_since_midnight)
    else
      write_attribute(:starts, ts)
    end
  end

  def ends=(ts)
    if ts.class == String and !ts.numeric?
      write_attribute(:ends, Time.parse(ts).seconds_since_midnight)
    else
      write_attribute(:ends, ts)
    end
  end
  
  rails_admin do
    base do
      field :user
      field :day
      field :starts do
        pretty_value do
          Time.now.midnight.since(bindings[:object].starts).strftime("%-I:%M%P")
        end
      end
      field :ends do
        pretty_value do
          Time.now.midnight.since(bindings[:object].ends).strftime("%-I:%M%P")
        end
      end
    end
    
    edit do
      configure :starts do
        def render
          value = ""
          value = Time.now.midnight.since(bindings[:object].starts).strftime("%-I:%M%P") unless bindings[:object].starts.nil?
          bindings[:view].render :partial => "time_select", :locals => { field: "starts", value: value }
        end
      end
      configure :ends do
        def render
          value = ""
          value = Time.now.midnight.since(bindings[:object].ends).strftime("%-I:%M%P") unless bindings[:object].ends.nil?
          bindings[:view].render :partial => "time_select", :locals => { field: "ends", value: value }
        end
      end
    end
  end
end
