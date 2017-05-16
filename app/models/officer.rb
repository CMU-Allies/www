class Officer < ApplicationRecord
  belongs_to :exec_board

  attr_accessor :present

  Officer_President       = "President"
  Officer_VP              = "Vice President"
  Officer_Social_Chair    = "Social Chair"
  Officer_Activism_Chair  = "Activism Chair"
  Officer_Support_Chair   = "Support Chair"
  Officer_Treasurer       = "Treasurer"

  Officers_All = [
    Officer_President,
    Officer_VP,
    Officer_Social_Chair,
    Officer_Activism_Chair,
    Officer_Support_Chair,
    Officer_Treasurer
  ]

  validates :name, presence: true

  validates :position,
    presence: true,
    inclusion: { in: Officers_All },
    uniqueness: {scope: :exec_board}

  def sort_index
    Officers_All.each_index { |role_index| return role_index if Officers_All[role_index] == position }
    return -1
  end

  def <=> (officer)
    return 1 if sort_index < 0
    return -1 if officer.sort_index < 0
    return sort_index <=> officer.sort_index
  end

end
