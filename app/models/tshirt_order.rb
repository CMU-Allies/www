class TshirtOrder < ActiveRecord::Base
  validates :name, presence: true
  validates :tshirt, inclusion: { in: Tshirt.available_shirts }
  validates :qty, numericality: { greater_than: 0 }

  belongs_to :tshirt
end
