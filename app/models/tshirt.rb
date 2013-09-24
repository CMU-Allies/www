class Tshirt < ActiveRecord::Base
  validates_presence_of :name, :size, :price
  validates_numericality_of :price

  def self.available_shirts
    Tshirt.where(:available => true)
  end
end
