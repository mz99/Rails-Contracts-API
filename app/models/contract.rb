class Contract < ApplicationRecord
  require 'date'
  require 'time'
  belongs_to :user, optional: true
  validates :vendor, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validate  :ends_date_cannot_be_less_than_start_date

  def ends_date_cannot_be_less_than_start_date
    if ends_on < starts_on
      errors.add(:ends_on, "Ends on date should be greater than start date")
    end
  end
end
