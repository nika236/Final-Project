class Booking < ApplicationRecord
  belongs_to :lecturer
  belongs_to :user

  before_create do
    self.start_date = lecturer.start_date.freeze
    self.end_date = lecturer.end_date.freeze
  end
end
