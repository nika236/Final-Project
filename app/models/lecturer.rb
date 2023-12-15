class Lecturer < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence:true
  belongs_to :subject
  has_many :bookings, dependent: :destroy
  validate :cant_be_in_past
  validate :end_date_after_start_date




  def cant_be_in_past
    errors.add(:start_date, "can't be in the past") if start_date && start_date < Date.today
  end

  def end_date_after_start_date
    return unless start_date.present? && end_date.present?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  # def no_overlapping_lecture
  #   return unless start_date.present? && end_date.present?
  #
  #   overlapping_bookings = lecturer.bookings.where(
  #     "(start_date <= ? AND end_date >= ?) OR (start_date <= ? AND end_date >= ?) OR (start_date >= ? AND end_date <= ?)",
  #     end_date, start_date, start_date, end_date, start_date, end_date
  #   )
  #
  #
  #   if overlapping_bookings.exists?
  #     errors.add(:base, "Another Lecturer has lecture for this time")
  #
  #   end
  # end
end
