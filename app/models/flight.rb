class Flight < ApplicationRecord
  validates :std, presence: true
  validates :etd, presence: true
  validates :airline, presence: true
  validates :flight_no, presence: true
  validates :destination, presence: true
  validates :gate, presence: true
  
  validate :std_cannot_be_in_the_past
  validate :etd_cannot_be_in_the_past
  
  scope :not_in_past, -> { where("std >= ? OR etd >= ?", Time.current, Time.current) }
  scope :current_day, -> { 
    where("DATE(std) = ? OR DATE(etd) = ?", Date.current, Date.current)
      .where("std >= ? OR etd >= ?", Time.current, Time.current)
  }
  scope :ordered_by_std, -> { order(:std) }
  
  private
  
  def std_cannot_be_in_the_past
    if std.present? && std < Time.current
      errors.add(:std, "cannot be in the past")
    end
  end
  
  def etd_cannot_be_in_the_past
    if etd.present? && etd < Time.current
      errors.add(:etd, "cannot be in the past")
    end
  end
end
