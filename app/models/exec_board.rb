class PresidentValidator < ActiveModel::Validator
  def validate(record)
    if not record.officers.any? {|officer| officer.position == Officer::Officer_President}
      record.errors.add(:base, "A president is required")
    end
  end
end

class ExecBoard < ApplicationRecord
  has_many :officers

  validates :year, presence: true, uniqueness: true
  validates :officers, presence: true
  validates_associated :officers
  validates_with PresidentValidator

  accepts_nested_attributes_for :officers, allow_destroy: true, reject_if: :officer_not_present

  extend FriendlyId
  friendly_id :year, use: [:finders]

  def president
    officers.where(position: Officer::Officer_President).first
  end

  def executive
    officers.where.not(position: Officer::Officer_President).sort
  end

  def display_year
    "#{year} - #{year+1}"
  end

  private
    def officer_not_present(attributes)
      attributes[:present] == "0"
    end

end
