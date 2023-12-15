class Subject < ApplicationRecord
  has_many :lecturers, dependent: :destroy
  validates :name, presence: true , uniqueness: {case_sensitive: false}
  validates :description, presence: true
end
